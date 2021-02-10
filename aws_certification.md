# AWS Certifications

> *Quick documentation links:* \
> [AWS Whitepapers](https://aws.amazon.com/whitepapers/) \
> [AWS Documentation](https://docs.aws.amazon.com/index.html) \
> [How AWS Pricing Works](https://d1.awsstatic.com/whitepapers/aws_pricing_overview.pdf) \
> [Overview of Amazon Web Services AWS Whitepaper](https://d0.awsstatic.com/whitepapers/aws-overview.pdf)

## AWS Cloud Practitioner Essentials


### Module 1: INTRODUCTION

#### Definitions / Additional resources / Links

* **Cloud computing**="...on-demand delivery of IT resources over the internet with pay-as-you-go pricing."



### Module 2: COMPUTE IN THE CLOUD

* Amazon **EC2 instance types** (5):
  * General purpose
  * Compute optimized
  * Memory optimized
  * Accelerated computing
  * Storage optimized

* Amazon **EC2 pricing**
  * On-Demand - ...for short-term, irregular workloads that cannot be interrupted...
  * Savings Plan - ...commitment to a consistent amount of usage (measured in $/hour) for a 1 or 3 year term....
  * Reserved Instances - ...assigned to a specific Availability Zone, they provide a capacity reservation... either 1 year or 3 years...
  * Spot instances - ...spare Amazon EC2 computing capacity; AWS can re-claim any time; 2 minute warning...
  * Dedicated Hosts
*Note:* ...primary difference between the two programs is that Reserved Instances offer a discount against On-Demand pricing depending on committed utilization, whereas Savings Plans offer a discount depending on committed spend.... [link](https://www.cloudhealthtech.com/blog/reserved-instances-vs-aws-saving-plans)

* Amazon EC2 **Auto Scaling** (2)
  * _dynamic_ scaling - responds to changing demand
  * _predictive_ scaling - automatically schedules...based on predicted demand
* Elastic Load Balancing (**ELB**) - _Regional_ level
* **Messaging and queuing**
  * Note: **loosely coupled** - ...an architecture where if one component fails, it is isolated and therefore won't cause cascading failures throughout the whole system...
  * Simple Queue Service (**SQS**) - a message queuing service; _...fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless application..._; data in message='payload'
  * Simple Notification Service (**SNS**) - a publish/subscribe service; _...messaging service for both application-to-application (A2A) and application-to-person (A2P) communication..._
* AWS **Lambda** - serverless compute service; run time <15min
* Amazon Elastic Container Service (Amazon **ECS**) - _...a container management system..._
* Amazon Elastic Kubernetes Service (Amazon **EKS**) - _... a fully managed service that you can use to run Kubernetes on AWS..._
* Amazon **Fargate** - _...serverless compute engine for containers. It works with both Amazon ECS and Amazon EKS..._

* Overview Compute Services [link](https://aws.amazon.com/products/compute/)
  * Instances (Virtual machines)
  * Containers
  * Serverless
  * Edge and Hybrid

- [ ] **TODO** Difference between ECS and EKS
- [ ] **TODO** Understand Fargate better
  


### Module 3: GLOBAL INFRASTRUCTURE AND RELIABILITY

* **Region** -  separate geographic area; consists of _two or more_ Availability Zones (AZ)
* Sselection criteria for choosing a region (four business factors):
  * **Compliance** with data governance and legal requirements
  * **Proximity** to your customers
  * **Feature availability** - Available services within a Region
  * **Pricing** - each region has different price sheet

* **Availability zone** (**AZ**)
  * each region = many datacenters;  availability zone = one or many datacenters
  * ...as a best practice with AWS, we always recommend you run across at least two Availability Zones in a Region.....
  * many services are on a regional level already (e.g. ELB); regionally scoped service = meaning they run synchronously across multiple AZs

* **Edge locations**
  * CDN = Content Delivery Network
  * Amazon's CDN = Amazon **Cloudfront**
  * Cloudfront uses 'Edge locations'
  * Also run 'Amazon Route 53' - highly available and scalable cloud Domain Name System (DNS) web service

* **AWS Outposts** - where AWS will basically install a fully operational mini Region, right inside your own data center.

* Ways to interact with AWS services:
  * AWS Mangement Console
  * AWS Command line interface (CLI)
  * SDKs
* AWS **Elastic Beanstalk** - ...service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python... [link](https://aws.amazon.com/elasticbeanstalk/)
* AWS **CloudFormation** - ...infrastructure as code tool...

- [ ] **TODO** (Key-)differences between AWS CloudFormation and Terraform




### Module 4: NETWORKING

* Amazon Virtual Private Cloud (**VPC**) - logically isolated (network) section; essentially your own private network in AWS
  * **Internet gateway** - to allow public traffic from the internet to access your VPC
  * **Virtual private gateway** - enables you to establish a virtual private network (VPN) connection between your VPC and a private network
  * **AWS Direct Connect**  - a service that enables establishing a dedicated private connection between your DC and a VPC; need to work with a Direct Connect partner
_Note:_ ...a VPC can have multiple types of gateways attached ...

* ...only technical reason to use subnets in a VPC is to control access to the gateways....public subnets have access to the internet gateway; the private subnets do not
* Network access control lists (**ACL**s) - virtual firewall that controls inbound and outbound traffic at the _subnet level_.
  * ...Each AWS account includes a default network ACL...whcih allows all inbound and outbound traffic
* **Security groups** - virtual firewall that controls inbound and outbound traffic for an Amazon EC2 instance _= EC 2 instance level_
* _Note:_ Security group = stateful;  Network ACL = stateless

* Amazon Route 53 (DNS) routing policies:
  * routing policies
  * latency-based routing
  * geolocation DNS
  * geoproximity
  * weighted round robin.



### Module 5: STORAGE AND DATABASES

* EC2 instance - local storage called _instance store volumes_; volumes are physically attached to the (EC2-)host. **ephemeral!** (temporary)

* Amazon Elastic Block Store (Amazon **EBS**); virtual harddrives = EBS volumes
* EBS snapshot -  incremental backup.

* Amazon Simple Storage Service (Amazon *S3*) -  object-level storage; 11 nines of durability; max file size 5TB
* S3 Amazon S3 storage classes; two factors: (1) how often retrieve data; (2) how available data needs to be; min 3 AZs (_regional_ service)
  * S3 Standard - data stored in at least 3 AZs
  * S3 Standard-Infrequent Access (S3 Standard-IA)
  * S3 One Zone-Infrequent Access (S3 One Zone-IA)
  * S3 Intelligent-Tiering
  * S3 Glacier
  * S3 Glacier Deep Archive

* Amazon Elastic File System (Amazon **EFS**) - fully managed elastic NFS file system; scalable.
* Note: for **EFS** on-premises servers can access Amazon EFS using AWS Direct Connect.

Amazon EBS | Amazon EFS
------------ | -------------
Volumes EC2 instance attached      |   Multiple instances can read/write
AZ level resource; need be same AZ as EC2 instance   |  Regional resource
Volumes to not automatically scale | Automatically scales


* Amazon Relational Database Service (Amazon **RDS**) - managed service that enables you to run relational databases in the AWS Cloud.
* **RDS** services includes: automated patching, backups, redundancy, failover, disaster recovery
* Amazon **RDS** is available on _six database engines_
  * MySQL
  * PostgreSQL
  * MariaDB
  * Oracle
  * Microsoft SQL Server
  * Amazon **Aurora** - MySQL and PostgreSQL-compatible relational database built for the cloud (replicates six copies to three AZs; continuously backs up data to S3)

* Amazon **DynamoDB** - non-relationsl, NoSQL database; key-value and document database service; serverless.

* Amazon **Redshift** - data warehousing service (e.g. for big data analytics; BI solutions).

* AWS Database Migration Service (AWS **DMS**)
  * "...The source and target databases can be of the _same_ type _or different_ types...."
  * "...supports homogeneous migrations such as Oracle to Oracle, as well as heterogeneous migrations between different database platforms..."

* Additional database services
  * Amazon **DocumentDB** - document database service; MongoDB compatible.
  * Amazon **Neptune** - graph database service.
  * Amazon **Quantum Ledger Database** (Amazon _QLDB_) - ledger database service; immutable system of record
  * Amazon **Managed Blockchain**
  * Amazon **ElastiCache** - service adding caching layers on top db; supports two types of data stores: _Redis_ and _Memcached_.
  * Amazon **DynamoDB Accelerator** - in-memory cache for DynamoDB; improving read-times.



### Module 6: SECURITY

* **Shared responsibility model** - _AWS_ controls security __of__ the cloud and _customers_ control security __in__ the cloud
  * Customers: Security in the cloud
  * AWS: Security of the cloud

* AWS Identity and Access Management (**IAM**)
  * authentication and authorization as a service
  * identity federation
  * **root account user** = owner of the AWS account
* **IAM users** - by default IAM user has zero permissions;
* **IAM policy** - a document that allows or denies permissions to AWS services and resources; JSON format; can apply to IAM users, groups, or roles.
  * `Action`:can list any AWS API call
  * `Resource`: list what AWS resource that specific API call is for.
* **IAM group** - is a collection of IAM users
* **IAM roles** - an identity that you can assume to gain temporary access to permissions.
  * Note: _When someone assumes an IAM role, they abandon all previous permissions that they had under a previous role and assume the permissions of the new role._

* **AWS Organizations** - group accounts into organizational units (OUs) to make it easier to manage accounts
  * Centralized management
  * Consolidated billing - combine the usage across all accounts in the organization to share pricing discounts
  * Hierarchical groupings of accounts
  * AWS service and API actions access control
  * Service control policies (**SCP**s) - can be applied to an organization _root_, an _individual member account_, or an _OU_.

* **AWS Artifact** - a service that provides on-demand access to AWS security and compliance reports
  * Access AWS compliance reports on-demand.
  * Review, accept, and manage agreements with AWS.
* Customer Compliance Center [link](https://aws.amazon.com/compliance/customer-center/)
* AWS will not automatically replicate data across regtions

* **DDos** attack - a deliberate attempt to make a website or application
  * _distributed_ DDoS attack - multiple sources are used to start an attack
* **AWS Shield** - a service that protects applications against DDoS attacks
  * _Standard_ - automatically protects all AWS customers at no cost.
  * _Advanced_ - paid service; detailed attack diagnostics; detect and mitigate sophisticated DDoS attacks; integrates with CloudFront, Route 53, ELB, and AWS WAF.

* Additional security services:
  * AWS **Key Management Service** (AWS **KMS**)
  * AWS **WAF** - web application firewall.
  * Amazon **Inspector** - automated security assessment service for exposure, vulnerabilities, and deviations from best practices. EC2 agent available.
  * Amazon **GuardDuty** - intelligent threat detection for infrastructure and resources; analyzes continuous streams of metadata from your account, and network activity from CloudTrail events, VPC Flow Logs, and DNS logs.




### Module 7: MONITORING AND ANALYTICS

* **Monitoring** - Oberving systems, collecting metrics, and then using data to make decision.

* Amazon **CloudWatch** - monitoring and observability service; CloudWatch alarms; integrated with SNS.

* AWS **CloudTrail** records API calls for account; recorded information includes:
  * identity of the API caller
  * time of the API call
  * source IP address of the API caller
  * etc
* Events are typically updated in CloudTrail within 15 minutes after an API call; can filter events.
* AWS **CloudTrail _Insights_** - optional feature; automatically detect unusual API activities

* AWS **Trusted Advisor** - online tool providing real time guidance following AWS best practices; Some checks are free, others available depending on the level support plan.
  * Cost optimization
  * Performance
  * Security
  * Fault tolerance
  * Service limit
* AWS Trusted Advisor Categories:
  * green - no problems.
  * orange - recommended investigations.
  * red - recommended actions.




### Module 9: PRICING AND SUPPORT

* AWS **Free Tier**:
  * Always Free
  * 12 Months Free
  * Trials
* Pricing:
  * Pay for what you use.
  * Pay less when you reserve.
  * Pay less with volume-based discounts when you use more.

* **Consolidated billing**

* **AWS Budgets** - create budgets to plan your service usage, service costs, and instance reservations.

* **AWS Cost Explorer**

* **AWS Support plans**
  * Basic support - any customer
  * Developer tier - in addition: Email customer support (24h response)
  * Business tier - _all_ Trusted Advisor functionality, direct phone support access
  * Enterprise support - 15-minute SLA, Technical Account Manager (TAM)

* **AWS Marketplace** - digital catalog that includes thousands of software listings from independent software vendors.





### Module 9: MIGRATION AND INNOVATION

* AWS Cloud Adoption Framework (AWS **CAF**) - organizes guidance into six areas of focus, called _Perspectives_:
* _Business perspectives_:
  * Business Perspective (1) - move from a model that separates business and IT strategies into a business model that integrates IT strategy.
  * People Perspective (2) - operating and recovering IT workloads to meet the requirements of your business stakeholders.
  * Governance Perspectiv (3) - skills and processes to align IT strategy with business strategy.
* _Technical Perspectives_:
  * Platform Perspective (4) - principles and patterns for implementing new solutions on the cloud, and migrating on-premises workloads to the cloud.
  * Security Perspective (5) - ensures meeting security objectives for visibility, auditability, control, and agility.
  * Operations Perspective (6) - focuses on operating and recovering IT workloads to meet the requirements of your business stakeholders.

* **Migration strategies** - six of the most common migration strategies (six **R**s)
  * (1) Rehosting - lift-and-shift
  * (2) Replatforming - lift, tinker, and shift; Optimization is achieved without changing the core architecture of the application.
  * (3) Refactoring / re-architecting - ...Refactoring is driven by a strong business need to add features, scale, or performance...
  * (4) Repurchasing - e.g. move from a traditional license to a software-as-a-service model.
  * (5) Retaining - keep applications that are critical for the business in the source environment.
  * (6) Retiring - removing applications that are no longer needed.

* AWS **Snow Family** - collection of physical devices that help to physically transport data in and out of AWS.
  * Example: dedicated 1Gbps network moved 1 PB of data in ~ 100 days.
* AWS Snow Family is composed of:
  * AWS Snowcone - holds up to 8TB of data.
  * AWS Snowball - either Edge Storage Optimized (80 TB) or Edge Compute Optimized (42 TB)
  * AWS Snowmobile - 100 Petabytes

* Innovation with AWS
  * VMWare Cloud on AWS
  * Amazon **SageMaker** - machine learning (ML)
  * Amazon Augmented AI (**A2I**)
  * Amazon Lex - core of Alexa
  * Amazon **Textract** - extract text
  * AWS **Deep Racer**
  * Internet of Things
  * AWS Ground Statsion - satelite time
  * etc




### Module 10: THE CLOUD JOURNEY

* AWS **Well-Architected Framework**. Five Pillars:
  * Operational Excellence -  gain insight; run and monitor systems to deliver business value and to continually improve supporting processes and procedures.
  * Security - protect information, systems, and assets while delivering business value through risk assessments and mitigation strategies.
  * Reliability - recover from infrastructure or service disruptions; dynamically acquire resources to meet demand; mitigate disruptions.
  * Performance Efficiency -  use computing resources efficiently to meet system requirements; informed decision.
  * Cost Optimization - run systems to deliver business value at the lowest price point.
* **Well-Architected Tool**

* Benefits of the AWS Cloud (6)
  * Trade upfront expense for variable expense. (1)
  * Benefit from massive economies of scale. (2)
  * Stop guessing capacity. (3)
  * Increase speed and agility. (4)
  * Stop spending money running and maintaining data centers. (5)
  * Go global in minutes. (6)



### Module 11: AWS CERTIFIED CLOUD PRACTITIONER BASICS

* **Exam strategies**
  * Read the full question.
  * Predict the answer before reviewing the response options.
  * Eliminate incorrect response options.


### Final Assessment

* Which Perspective of the AWS Cloud Adoption Framework focuses on recovering IT workloads to meet the requirements of your business stakeholders? _Operations Persepctive_ (answered: Governance b/c of DR)
* Which statement best describes an Availability Zone? _A fully isolated portion of the AWS global infrastructure._; "A separate geographical location with multiple locations that are isolated from each other" - This response option describes a Region.
* Which pillar of the AWS Well-Architected Framework focuses on using computing resources in ways that meet system requirements? _Performance Efficiency_
  * Performance Efficiency pillar focuses on using computing resources efficiently to meet system requirements, and to maintain that efficiency as demand changes and technologies evolve.
  * Operational Excellence pillar includes the ability to run workloads effectively, gain insights into their operations, and continuously improve supporting processes to deliver business value. 
  * Security pillar focuses on protecting data, systems, and assets. It also focuses on using cloud technologies to improve the security of your workloads.
  * Reliability pillar focuses on the ability of a workload to consistently and correctly perform its intended functions.
* Which compute option reduces costs when you commit to a consistent amount of compute usage for a 1-year or 3-year term? Not: Reserved instances; Correct: Savings Plan
  * Amazon EC2 Savings Plans enable you to reduce your compute costs by committing to a consistent amount of compute usage for a 1-year or 3-year term. 
  * Reserved Instances are a billing discount that is applied to the use of On-Demand Instances in your account. You can purchase Standard Reserved and Convertible Reserved Instances for a one-year or three-year term, and Scheduled Reserved Instances for a one-year term. _Unlike Savings Plans, Reserved Instances do not require you to commit to a consistent amount of compute usage over the duration of the contract._

* **Misc**
  * A network access control list (ACL) is a virtual firewall that controls inbound and outbound traffic at the subnet level.
  * A security group is a virtual firewall that controls inbound and outbound traffic for an Amazon EC2 instance. 
  * S3 One Zone-IA is ideal for infrequently accessed data that does not require high availability.


## AWS Certified Solutions Architect

### Documentation to read

* [AWS Documentation](https://docs.aws.amazon.com/)
* [AWS FAQs](https://aws.amazon.com/faqs/)
* [AWS Whitepapers](https://aws.amazon.com/whitepapers)
  * [Architecting for the Cloud: AWS Best Practices (Archived)](https://d1.awsstatic.com/whitepapers/AWS_Cloud_Best_Practices.pdf) (Archived)
    * _Successor:_ [AWS Well Architected Framework](https://d1.awsstatic.com/whitepapers/architecture/AWS_Well-Architected_Framework.pdf)
  * [AWS Security Best Practices]()
  * [Overview of Amazon Web Services]()
  * [AWS STorage Services Overview]()
  * [AWS Well Architected Framework]()
  * [Overview of Security Processes]()

* [AWS Architecture Center](https://aws.amazon.com/architecture)
* [AWS Answers](https://aws.amazon.com/answers/)

Read Whitepapers initially (top 3), study thoroughly when preparing for exam.
Additional ones: bottom three; at a later stage but also fundamental.

#### Videos
* AWS Event Videos
* Suggested video: Another Day, Another Billion Packets
