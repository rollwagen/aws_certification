# AWS Certified Developer Associate


## AWS Serverless: Lambda (Section 16)
- up to 3GB of RAM (increaing RAM will also improve vCPU and network)
  - at 1'792 MB a Lambda function has the equivalent of one full vCPU
  - after 1'792 MB you have more than one CPU, need to use multi-threading to benefit
  - if your Lambda function is CPU-bound, increase RAM (to get more vCPU)
- December 2020: AWS Lambda changes duration billing granularity from 100ms down to 1ms 
- `tmp` directory max temp space is 512MB
- dependencies: if <=50MB upload straight to Lambda; if more then S3
- concurrency: up to 1000; limit applies across whole account; limit/control with _reserved concurrency_
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


Event Source Mapping
• Kinesis Data Streams
• SQS & SQS FIFO queue
• DynamoDB Streams
• Common denominator: records need to be polled from the source
• Your Lambda function is invoked synchronously

SQS To use a DLQ
• set-up on the SQS queue, not Lambda (DLQ for Lambda is only for async invocations)
• Or use a Lambda destination for failures

Lambda in VPN
- a Lambda function in your VPC does not have internet access
- deploying a Lambda function in a public subnet does not give it internet access or a public IP
- deploying a Lambda function in a private subnet gives it internet access if you have a NAT Gateway / Instance

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
 
- Global Secondary Index - GSI
  - if the writes are throttled on the GSI, then the main table will be throttled!

- DynamoDB Streams
  - stream has 24h of data retention
  - records are not retroactively populated





## AWS Serverless Application Model (SAM)

