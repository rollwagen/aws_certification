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
