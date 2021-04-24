# AWS Certified Developer Associate


## AWS Serverless: Lambda (Section 16)
- up to 3GB of RAM (increaing RAM will also improve vCPU and network)
  - at 1'792 MB a Lambda function has the equivalent of one full vCPU
  - after 1'792 MB you have more than one CPU, need to use multi-threading to benefit
  - if your Lambda function is CPU-bound, increase RAM (to get more vCPU)
- December 2020: AWS Lambda changes duration billing granularity from 100ms down to 1ms 
- `tmp` directory max temp space is 512MB
- dependencies: if <=50MB upload straight to Lambda; if more then S3
- **concurrency**
  - up to 1000 per second; limit applies across whole account per region (???); burst up to 3000
  - limit/control with _reserved concurrency_
    - AWS keeps unreserved concurrency pool at a min. of 100 concurrent executions so functions witout specific limits set can still process requests. Hence, can only allocate a concurrent execution limit of 900 max for a single Lambda function or 450 for two functions.
  - estimate capacity: `concurrent executions = (invocations per second) x (average execution duration in seconds)`
- _provisioned concurrency_ - concurrency is allocated before funcion is invoked (no cold start)
- to expose a Lambda function as an HTTP(S) endpoint, two options; both invoke synchroniously
  1. ALB (Applicatio Load Balancer) _or_
  2. API Gateway (API GW)
- ALB to Lambda; HTTP will be converted to JSON
- ALB Multi-Header Values are supported (ALB setting)
  - `http://example.com/path?name=foo&name=bar`  will become
  - `queryStringParameters”: {“name”: [“foo”,”bar”] }`

- Limits (per region)
  Execution:
    - 128MB - 3008MB
    - max execution time 15min (900sec)
    - env variables 4KB
    - disk capacity in 'functions container `/tmp` 512MB
  - Deployment: 
    - deployment size 50MB
    - uncompressed deployment 250MB
    - env variables 4KB

- Asynchronous invocation relevant for exam:
  - Amazon Simple Storage Service (S3)
  - Amazon Simple Notification Service (SNS)
  - Amazon CloudWatch Events / EventBridge

- Event Source Mapping
  - Kinesis Data Streams
  - SQS & SQS FIFO queue
  - DynamoDB Streams
  - Common denominator: records need to be polled from the source
  - Your Lambda function is invoked synchronously

SQS To use a DLQ
• set-up on the SQS queue, not Lambda (DLQ for Lambda is only for async invocations)
• Or use a Lambda destination for failures

Lambda in VPC
- a Lambda function in your VPC does not have internet access
- deploying a Lambda function in a public subnet does not give it internet access or a public IP
- deploying a Lambda function in a private subnet gives it internet access if you have a NAT Gateway / Instance

- API 'Invoke' call; InvocationType:
  - RequestResponse (default) - synchronously
  - Event - asynchronously
  - DryRun - Validate parameter values and verify that the user or role has permission to invoke the function.

- X-Ray environment varibles (Lambda):
  - `_X_AMZN_TRACE_ID`, `AWS_XRAY_CONTEXT_MISSING`, `AWS_XRAY_DAEMON_ADDRESS`

## AWS Serverless: DynamoDB
- items/rows; max size of an item is 400KB
- Strongly Consistent Read (default) vs Eventually Consistent Read
– Read Capacity Units
  - One RCU = one strongly consistent read per second, OO two eventually consistent reads per second, for item up to 4 KB in size.
  - If the items are larger than 4 KB, more RCU are consumed
- Write Capacity Units (WCU)
  - One write capacity unit represents one write per second for an item up to 1 KB in size.
- DynameDB APIs
  - Write
    - _PutItem_ - full replace
    - _UpdateItem_ - partial update of attributes
    - _Conditional Writes_ - accept write or update only if condition is met; otherwise reject
  - Delete
    - _DeleteItem_ - delete an individual row
    - _DeleteTable_ - delete whole table
  - Batching writes 
    - _BatchWriteItem_ - up to 25 PutItem or DeleteItem; up to 16MB; up to 400KB per item
  - Reading
    - _GetItem_ - read based on Primary key, use 'ProjectionExpression' to only retrieve specific attributes
  - Query - returns items based on PartitionKey (must be **=** operator); SortKey, FilterExpression (client side!)
  - Scan - inefficient; scans entire table and then filter data; will consume a lot of RCUDeleteItem
    - to minimize scan impact: **Reduce page size**: smaller page size uses fewer read operations and creates a “pause” between each request.
 
- Global Secondary Index - GSI
  - if the writes are throttled on the GSI, then the main table will be throttled!
- Local Secondary Index - LSI:
  - Uses the WCU and RCU of the main table
  - No special throttling considerations

- DynamoDB Streams
  - stream has 24h of data retention
  - records are not retroactively populated
  - stream options
    - `KEYS_ONLY` — Only the key attributes of the modified item.
    - `NEW_IMAGE` — The entire item, as it appears after it was modified.
    - `OLD_IMAGE` — The entire item, as it appeared before it was modified.
    - `NEW_AND_OLD_IMAGES` — Both the new and the old images of the item

- DynamoDB TTL (Time to Live)
  - automatically delete an item after an expiry date / time
  - no extra cost, deletions do not use WCU / RCU

- DynamoDB CLI

## Elasticache
- Redis vs Memcached
  - Single/multithreading - commands execution, Redis is mostly a single-threaded server; not designed to benefit from multiple CPU cores unlike Memcached (however, can launch several Redis instances to scale out on several cores if needed.)

## Elastic Beanstalk
- Deployment Modes
  - Single Intance - for dev
  - High Availability with LB - for prod
- Deployments Options for Update
  - All at once - will stop and (re-)deploy new app version on existing instances; quick; no add'tl cost
  - Rolling - bucket size ('batches') can be set, no add'tl cost, long
  - Rolling iwth additional batches
  - Immutable
- [AWS Doc - Elastic Beanstalk Deployment Summary](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.deploy-existing-version.html)

## AWS CICD: CodeCommit, CodePipeline, CodeBuild, CodeDeploy

### AWS Code Commit
- Notifications
  - **SNS / AWS Lambda**
    - Push to main branch, Branch deletion, trigger/notify external build system or Lambda (e.g. to run static code analysis for credentials)
  - **Cloud Watch Event Rules**
    - Trigger for pull request activities (create, update, delete,comment)
    - triggered events will go into SNS topic

### AWS Code Pipeline
  - CodePipeline state changes happen in _AWS CloudWatch Events_, which can in return create SNS notifications.

### AWS Code Deploy
- order of hooks in appspec.yaml for **EC2** or on-prem instances (both with CodeDeploy agent
  - ApplicationStop
  - DownloadBundle
  - BeforeInstall
  - AfterInstall
  - ApplicationStart
  - ValidateService
- order of hooks in appsepc.yaml for **Lambda**
  - BeforeAllowTraffic
  - AfterAllowTraffic
- order of hooks in appsepc.yaml for **ECS**
  - BeforeInstall
  - AfterInstall
  - AfterAllowTestTraffic
  - BeforeAllowTraffic
  - AfterAllowTraffic

## SAM
- integrated with _CodeDeploy_
- traffic shifting options when deploying
  - _Canary_: Traffic is shifted in two increments. 
  - _Linear_: Traffic is shifted in equal increments with an equal number of minutes between each increment
  - _All-at-once_: All traffic is shifted from the original Lambda function to the updated Lambda function version at once.
## AWS Cloud Formation
- Functions
  - !Ref - reference a parameter or resource (physical ID), e.g. a vpc id for a vpc reference
  - !Fn::GetAtt - attribues for resources e.g. for an ec2 instance AZ `!GetAtt EC2Instance.AvailabilityZone`
  - Fn::FindInMap - return a names value from a specific key 
  - Fn::ImportValue - import values that are exported in other cf templates
  - Fn::Join - join values with a delimiter e.g. `!Join[ ":", [ a, b, c]` creates "a:b:c"
  - Fn::Sub - short for 'substitute' 
  - Condition Functions (Fn::If, Fn::Not, Fn::Equals, etc...)

## AWS Monitoring & Audit: CloudWatch, X-Ray & Cloudtrail
### CloudWatch
- EC2
  - Standard 5min
  - Detailed 1min
- Custom Metrics
  - Standard/default: 1min = 60s
  - High Resolution: 1 second  (_StorageResolution_ API param)
### CloudWatch Alarms
- Metric _evaluation period_
  - High resolution custom metrics can only choose either 10s or 30s
- When creating an alarm, three settings
  – **Period** - length of time to evaluate the metric or expression to create each individual data point for an alarm.
  – **Evaluation Period** - number of the most recent periods, or data points, to evaluate when determining alarm state.
  – **Datapoints to Alarm** - number of data points within the evaluation period that must be breaching to cause ALARM state

### X-Ray
- How to enable:
  1. code must import the AWS X-Ray SDK (Java, Python, Go Node.js, .NET)
    - application SDK will capture
      - calls to AWS services, HTTP(S) requets, database calls, queue calls (SQS)
  2. Install the X-Ray daemon or enable X-Ray AWS Integration
    - agent is a low level packet inspector
    - AWS Lamba and other AWS services alrealdy run X-Ray daemon
    - each app needs respective IAM rights to write to X-Ray
- **Annotations** - key-value pairs (fields) that are indxed for use with filter expressions; fields can have string, number, or Boolean values (no objects or arrays)
- **Metadata** - key-value pairs (fields) with any type value, including objects and arrays; _not indexed_

  
### CloudTrail
- Three type of Cloudtrail Events:
  - **Managment Events**; separate for Read Events and Write Events
  - **Data Events**; by default not logged e.g. S3 object level activity such as GetObject, PutObject; separate for Read Events and Write Events 
  - **Insights Events**

## API Gateway
- Metrics; common ones for monitoring (CloudWatch):
  - **IntegrationLatency** measure the responsiveness of the backend.
  - **Latency**  measure the overall responsiveness of your API calls.
  - **CacheHitCount** and **CacheMissCount** optimize cache capacities to achieve a desired performance.
