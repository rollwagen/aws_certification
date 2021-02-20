# AWS Certified SysOps Administrator – Associate (SOA-C02)

## [My Thoughts On the SysOps Administrator Associate BETA Exam - (SOA-C02)](https://www.reddit.com/r/AWSCertifications/comments/lkvcrp/my_thoughts_on_the_sysops_administrator_associate/)

### Question Topics

Obviously I want to be really careful here re. NDA. What I will do is give a list of things I think you should know - without revealing anything about question content.

* Be really familiar with all the DNS Record types, and when and where you can use them. APEX vs NONAPEX.
* Be really familiar with all of the R53 routing types ... failover, weighted, geolocation
* CloudFront Security - private, public, signed URL/Cookie, OAI, restricting direct S3 Access
* Pre-signed URLs with S3 ... know them INSIDE OUT (REALLY... EVERYTHING)
* Encryption at rest options for all storage platforms within AWS
* For the above, which can be only enabled at creation and what can be adjusted afterwards.
* EFS Architecture, availability and latency
* Logging .. Know the format of VPC flow logs,Cloudtrail, S3 Logs, CloudFront and ALB Logs
* Re. the above - know what is contained in each, network, metadata, contents, Layer 7 stuff be able to understand flow logs, interpret them.
* Understand how having NACL and SG in place at the same time can influence what's shown in logs.
* Diagnose why an EC2 instance isn't reachable - IP, Routing, Security
* HA using ASG - how many AZ/Subnets and how many instances, what Desired, Max and Min values to use.
* Spot Fleets - features, architectures and how they work with on-demand instances
* VPC restricted S3 Buckets - how, what endpoints, how to secure, policies - which and where
* Restricting bucket to an endpoint
* Configuring routing for gateway endpoints
* How to restrict or allow a bucket to an entire ORG.
* Protecting buckets .. objects and buckets from deletion
* How to diagnose and fix a failed service on EC2
* Developer environments, ensuring identical environments, how to allow start by developers and how to orchestrate termination.
* CloudFormation template structure
* Cross Stack References vs Nested
* EBS Storage performance and how to improve
* EFS Storage performance and how to improve
* Be able to diagnose why EC2 storage performance is slow on instance store, EBS or EFS and how to fix
* Understand the Architecture, HA and Migration for elastic search
* Templates which work in a region are now failing, why - understand what is limited to regions in a CFN template and how to change templates to be portable.
* For any given situation with known or unknown traffic patterns, regular or random load - know which ASG and Scaling policy to use.
* What information from EC2 needs a CWAgent vs what works as standard.
* How to control state on instances with below certain CPU
* Viewing costs of various groups of users, what products and features to use
* Network Ports - well known and ephemeral. You REALLY need to understand this. On a NACL, which rules need well known and which need ephemeral and which direction.
* How service quotas impact things, what error messages, how to resolve
* S3 Bucket Features - versioning, default encryption, lifecycle policies, Storage classes - know these all REALLY REALLY well.
* Automated reaction to ALB errors and lambda errors
* RTO and RPO ... on various AWS services
* For any given IAM Policy, be able to interpret and answer which of the answers is true or false.
* DDOS protection, configurable, rate limits, Shield & WAF
* Cross Account Access
* Access for people with no AWS account
* Directory Service, SSO and how to link with existing on premises platforms.

### Main Product Coverage - Learn These

* EC2
* Lambda
* S3
* EFS
* Glacier
* Storage gateway
* Backup
* RDS
* DynamoDB
* ElastiCache
* VPC
* CloudFront
* Route53
* Api Gateway
* AWS Orgs
* CloudWatch
* Auto Scaling
* CloudFormation
* Cloud Trail
* Config
* ElasticSearch
* IAM
* RAM
* SSO
* ACM
* KMS
* Directory Service
* WAF & Shield
* Cost Explorer
* Step Functions
* EventBridge (CloudWatch Events)
* SNS
* SQS
