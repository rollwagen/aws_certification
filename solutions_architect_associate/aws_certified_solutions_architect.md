# aws - training and certification

## Domain1: Design Resilient Architectures / 1.1 Design a multi-tier architecture solution

From AWS learning (Exam Readiness Video):

1. Determinme how to design a **multi-tier** architecture solution
2. Determinme how to design **high available** and/or _fault tolerant_ solutions
3. Determinme how to design **decoupling** mechanisms using AWS services
4. Choose **reliable/resilient storage**


### Resilient VPC Architectures (section form Pearson/O'Reilly video)

#### AWS Networking & VPCs

* [AWS Networking Fundementals (re:invent 2019](https://www.youtube.com/watch?v=hiKPPy584Mg&t=96s)
  * [Slides (pdf)](docs/aws-networking-fundamentals.pdf)
* [Amazon Virtual Private Cloud User Guide](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html)

* **VPC related topic from detailed topic lists**
  * _TD_: VPC/NACL/Security Groups
    * Study every service that is used to create a VPC (subnets, route tables, internet gateways, nat gateways, VPN gateways, etc).
    * Also, review on the differences of network access control lists and security groups, and during which situations they are applied.
  * _Cantril_: Networking
    * Basic VPC Architecture and config - IPv4 CIDR, IPv6
    * DNS in a VPC .. public and private DNS what IPs are resolved?
    * How to secure a multi-tier application in a VPC … routes, NACL/SG
    * VPC Peering - limits and features, transitive (NOT). DNS resolution.

_Following notes are from the re:invent video (linked above):_

Security group               | Network ACL
---------------------------- | -----------------------
Operates at instance level   | Operates at subnet level
Supports allow rules only    | Supports allow and deny rules
Is stateful                  | Is stateless
All rules evaluated before decision | Rules evaluated in order when deciding
Applies only to instances explicitly associated with the security group | Automatically applies to all instances launched into associated subnets

Note: Doesn’t filter traffic to or from link-local addresses (169.254.0.0/16) or AWS-reserved IPv4 addresses; these are the first four IPv4 addresses of the subnet (including the Amazon VPC DNS server)

* **VPC Peering**
  * private IP connectivity
  * can peer **across regions** and **across accounts**
  * VPC CIDR ranges **must not overlap**
  * Only one-to-one connections (e.g. no traversing)
  * 125 max peerings

* **Transit Gateway**
  * connects VPCs and on-premises networks through a central hub
  * allows any-to-any connection
  * has it's own routing table
  * can also be across accounts, ~~VPCs have to be in the same regtion~~ supports also **inter-Region peering**

(parameter)         | VPC Peering        |    Transit Gateway
VPC LIMIT           | 125 peerings       |   5,000 attachments
BANDWIDTH LIMIT     | N/A (intra-region) |  50Gbps per VPC attachment
MANAGEMENT          | Decentralised      |  Centralised
COST DIMENSIONS     | Data Transfer      |  Data Transfer & Attachment

* **VPC Endpoints** - _privately connect VPCs to supported AWS services and VPC endpoint services powered by AWS PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. Instances in your VPC do not require public IP addresses to communicate with resources in the service. Traffic between VPC and the other service does not leave the AWS network._
  * **Gateway endpoint** (Gateway VPC endpoint) - used purely for S3 and Dynamo DB
  * **Interface endpoint** (Interface VPC endpoint) - to connect to 'AWS Service APIs'
    * VPC endpoint services (AWS PrivateLink)
  * Gateway Load Balancer endpoint

* **AWS VPN**
  * always two IPSec tunnels, in two different Availability Zones for high-availability
  * can use a transit gateway or virtual private gateway as the gateway for the Amazon side of the Site-to-Site VPN connection


* _Following notes are from All-in-One book_ **Chapter 3 Virtual Private Cloud**
  * CIDR range, anything between /16 (65,536 IPs), and /28 (16 IPs).
  * once you create a VPC, you can’t alter the size of it.
  * VPC is limited to a region,
  * subnet is tied to only one availability zone.
  * From any subnet AWS reserves, the first four IP addresses and the last IP address are for internal networking purposes,
  * can associate multiple subnets with the same route table.
  * create a subnet, it is automatically associated with the main route table of the VPC
  * IG is a horizontally scaled, redundant, and highly available component
  * Each subnet must have a route table
  * NAT instance is a single point of failure.
  * You should be familiar with when to use a NAT gateway over a NAT instance.
  * NAT gateway and an egress-only gateway is the same (same purpose);  NAT gateway = only IPv4 traffic, egress-only gateway only IPv6
  * NAT instances, NAT gateways, and egress-only Internet gateways are stateful.


#### EC2
* EC2 Instance store -  disk type and capacity depends on instanct type

##### AMIs
* one EC2 instance can only have _one_ IAM role attached at a time
* Cross Acount AMI Copy [Maarek Slide #62](docs/AWS_Certified_Solutions_Architect_Slides_v3.6.pdf#page=62) / AWS documentation [Copying AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html)

##### EC2 Placement Groups
* Three strategies
  * Cluster - low latency group in single AZ; same rack same AZ. (+) low latency (+) 10GBps (-) rack fails, all gone
  * Spread - across underlying HW (max 7 instances per group per AZ), each instance on different HW. (+) can span across AZs
  * Partition - _partition_=set of racks; max 7 partitions per AZ; 100s of instances. EC instances can get access to partition info via metadata

#### Storage
* __REVIEW__ IAM vs Bucker Policies vs ACL
* **S3** - Simple Storage Service
  * bucket names: 3-63 characters long
  * objects have _key_; the _key_ is the full path
  * max 5TB object size; upload max 5GB, must use 'multi part upload'
  * flat namespace
  * can track access requests via _access logging_
  * 3,500 PUT/COPY/POST/DELETE or 5,500 GET/HEAD requests per second per prefix in a bucket.
  * S3 **Storage classes**
    * Standard - general purpose; 11 9s of durability; 99.99 availability
    * Standard-Infrequent Access (Standard-IA) - less frequently accesses, but rapid access when needed; 99.9 availability
    * One Zone-Infrequent Access
    * S3 Intelligent Tiering
    * Amazon Glacier - 'Archives' up to 40TB; Archives stored in Vaults
    * Amazon Glacier Deep Archives
  * S3 notification feature (events) for object _upload_ or _delete_; integration with SNS, SQS, and AWS Lambda
  * S3 **encryption**; 4 methods:
    * SSE-S3 - server side encryption; key management by AWS with AES-256
    * SSE-KMS - server side encryption; key managment with AWS KMS
    * SSE-C - server side encryption; key managment by your own; no available in console, only API/CLI
    * Client Side Enryption; not available in console, only API/CLI
  * S3 Security
    * User based (IAM policies)
    * Resource Based - Bucket Policies, and (less common) Object Access List (ACL) and Bucket Access Control List (ACL)
    * Note: IAM principal can acccess S3 object if either IAM permission OR resource policy allow, and no explicit DENY
    * Bucket settings for Block Public Access - can also be set at account level
  * CORS - Cross Origin Resource Sharing
* Amazon **Glacier**
  * archives up to 40TB (single archive limit)
  * minimum storage duration 90 days
  * integrated with AWS CloudTrail
  * can use as a storage class in S3 via S3 API, or 'native' via Amazon Glacier API
  * three (3) retrieval options
    * Expedited (1 to 5min)
    * Standards (3 to 4h)
    * Bulk (5 to 12h)
* Amazon **Glacier Deep Archive**
  * minimum storage duration 180 days
  * two (2) retrieval options
    * Standard (12h)
    * Bulk (48h)
* S3 Lifecycle Rules
  * Transition actions: define when object are transitioned to another storage calss
  * Expiration actions: delete after specified time
  * Rules can apply to certain _prefix_ or object _tags_

  
* **EBS**
  * EBS Volume Types
    * only GP2 and IO1 can be used as boot volumes
    * **gp2/gp3**
      * max IOPS 16,000 (3 IOPS/GB =  5,334GB max IOPS reached)
    * **io2/io1**
      * max IOPS 64,000 (Nitro only, rest 32,000)
    * **sti**
      * max IOPS 500
    * **sci**
      * max IOPS 250
  * EBS RAID
    * RAID0 (_exam relevant_) - stripe -> performace
    * RAID1 (_exam relevant_) - mirror -> fault tolerance
    * RAID5 + 6 - both not recommended for EBS/EC2

* **EFS**
  * multi-AZ
  * expensive compared to EBS (~ 3 x gp2), however, only pay per use (not pay per allocation as with EBS)
  * works with security groups
  * Windows AMI can't mount EFS; only works with Linux
  * 2 Performance mode: _General Purpose_ and _Max I/O_
  * Storage Tiers: _Standard_ and _Infrequent access (EFS-IA)_ (lower storage price, but cost to retrieve files)

* **FSx**
  * Amazon FSx for Windows - pay for the average amount of storage provisioned for your file systems per month; offers data de-duplication
  * Amazon FSx for Lustre - POSIX compliant

* **AWS Storage Gateway** (Hybrid Storage)
  * 3 types:
    * File Gateway - file-based; NFS/SMB; backed by S3
    * Volume Gateway - iSCSI; Volume; SAN-like; data stored in S2; can backup volumes as EBS Snapshots
    * Tape Gateway - VTL (Virtual Tape Library)


_2 read_ [EBS IO Characteristics](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-io-characteristics.html)


#### Route 53
* Most common records in AWS:
  * **A** - hostname to IPv4
  * **AAAA** - hostname to IPv6
  * **CNAME** - hostname to hostname
  * **Alias** - hostname to AWS resource
* CNAME vs ALIAS - if root domain (<domain>.com) has to be ALIAS (free of charge) - only for aws resources; CNAME only work for non-root domains

#### Load Balancers
* Types:
  * **Classic (CLB)**, v1 (2009) - HTTP, HTTPS, TCP
  * **Application (ALB)**, v2 (2016) - HTTP, HTTPS, WebSocket
  * **Network**, v2 (2017) - TCP, TLS (secure TCP) & UDP
* can be either external (public) or internal (private)
* Troubleshooting / errors:
  * 4xx - client induced errors
  * 5xx - errors are application induced errors
  * 503 means at capacity or no registered target
  * if LB can’t connect to app - security groups!
* IP / DNS
  * **NLB** - one static IP per AZ; supports Elastic IPs
  * **ALB/Classic** - no static IP, only static DNS hostname
* Cross-Zone Load Balancing
  * Classic - default: disabled; no charges
  * ALB - default: enabled; no charges
  * NLB - default: disabled; charges!
* SNI (Server Name Indication) only supported by ALB & NLB (not Classic); and CloudFront


#### RDS (Relational Database Services)
* Automated Backups: 7 days retention (max 35 days) _vs._ DB Snapshots: manually triggered; retention as long as you want
* Transparent Data Encryption (TDE) available for Oracle and MS SQL Server
* Read Replicas
  * help scale _reads_; within AZs, cross AZs, or cross region; ASYNC !
  * intra-/within AZ network cost; withing AZ for free
  * can promote to 'real' DB
* Multi AZ (Disaster recovery)
  * once DNS name; SYNC replcation; standby DB _only_ standby
  * Read Replicas can also be setup as Multi AZ (e.g. for DR)
* Aurora
  * Storage: auto expanding from 10G to 64TB
  * Auto-scaling for read replicas
  * Connection(s): Writer Endpoint and Reader Endpoint (loadbalancing at session/connection level)
  * Aurora Serverless
    * for infrequent or unpredictable workloads
  * Aurora Global Database
* RDS Databases ports:
  * PostgreSQL: 5432
  * MySQL / MariaDB: 3306
    * Oracle RDS: 1521
    * MSSQL Server: 1433
    * Aurora: 5432 (if PostgreSQL compatible) or 3306 (if MySQL compatible)

#### AWS ElastiCach
* manged Redis or Memcached
* support SSL in flight; do not support IAM authentication (IAM policies only for AWS API-level security)
* Redis AUTH - password/token

#### AWS Lambda
* Limits (per region), see also [Lambda quotas](https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-limits.html)
  * Execution
    * Memory allocation: 128 MB to 10,240 GB (1MB increments)
    * Max. execution time: 15min (900sec)
    * Environmetn variables: 4KB
    * Concurrent executions: 1000 (can be increased)
  * Deployment
    * Deployment package size: 50MB (zipped), 250MB (unzipped)
* Lambda@Edge - can use Lambda to change CloudFront requests and responses:
  * After CloudFront receives a request from a viewer (viewer request)
  * Before CloudFront forwards the request to the origin (origin request)
  * After CloudFront receives the response from the origin (origin response)
  * Before CloudFront forwards the response to the viewer (viewer response)
* AWS SAM - Serverless Application Model
  * develop / deploy serverless application
  * all config is YAML code
    * Lambda Function
    * DynamoDB tables
    * API Gateway
    * Cognito User Pools
  * can run Lambda, API GW, Dynamo DB locally
  * can use CodeDeploy

#### Dynamo DB
* Read Capacity Units (RCU) / Write Capacity Units (WCU)
* DAX - DynamoDB Accelerator
  * (Seamless) cache for Dynamo DB

#### API Gateway
* Integrations
  * _Lambda_ Function
  * _HTTP_ - e.g. internal HTTP API (even on-prem), ALB etc
  * _AWS_ Service - any AWS API
* API Gateway Endpoint Types:
  * Edge-Optimized (default) - requests routed though CloudFront edge; API GW still lived in one regtion
  * Regional - can still if wanted be combined with CloudFround (manually)
  * Private - only accessible from within VPC via VPC endpoint (ENI)
* Security
  * IAM Permissions - good for access within own infrastructure/AWS account; "Sig v4" (IAM credentials in headers); can't use outside AWS
  * Lambda Authorizer (formerly Custom Authorizer) - uses Lambda for token validation; help with use of OAuth / SAML / 3rd party; Lambda msut return IAM policy for user
  * Cognito User Pools - however, only helps with authentication, not authoriztion (must implement in backend)

#### AWS Cognito
* 'give users an identity so they can interact with our application.'
* Various products:
  * Cognito User Pools (CPU) - sign in functionality for application users; integrated with API Gateway
    * user pool is a user directory in Amazon Cognito
  * Cognito Identiy Pools (Federated Identiy) - provide AWS credential to users to access AWS resources directly
  * Cognito Sync - synchronize data from device to Cognito; replaced by AWS AppSync  (like deprecated soon)

#### Monitoring / AWS CloudWatch
* CloudWatch dashboards are global
* (EC2) CloudWatch metric intervals:
  * default: 5min
  * detailed: 1min
  * high-resolution: 1sec; only CustomMetrics via PutMetricData API
* Cloud Watch alarms for High Resolution metrics can trigger max every 10sec

#### AWS WAF - Web Application Firewall
* can be deployed on _three_ services: Application Load Balancer (ALB), API Gateway (API GW), CloudFround
* AWS Firewall Manager - manage all rules in all acount in an AWS Organization

## 1.2 Design highly available and/or fault-tolerant architectures
## 1.3 Design decoupling mechanisms using AWS services
## 1.4 Choose appropriate resilient storag