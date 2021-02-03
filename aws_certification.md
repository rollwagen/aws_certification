# AWS Certifications

> *Quick documentation links:* \
> [AWS Whitepapers](https://aws.amazon.com/whitepapers/) \
> [AWS Documentation](https://docs.aws.amazon.com/index.html)

## AWS Cloud Practitioner Essentials

### Module 1

#### Definitions / Additional resources / Links
* **Cloud computing**="...on-demand delivery of IT resources over the internet with pay-as-you-go pricing."
* [Overview of Amazon Web Services AWS Whitepaper](https://d0.awsstatic.com/whitepapers/aws-overview.pdf)


### Module 2

* Amazon EC2 **instance types** (5):
  * General purpose
  * Compute optimized
  * Memory optimized
  * Accelerated computing
  * Storage optimized

* Amazon EC2 **pricing**
  * On-Demand _...for short-term, irregular workloads that cannot be interrupted..._
  * Savings Plan _...commitment to a consistent amount of usage (measured in $/hour) for a 1 or 3 year term...._
  * Reserved Instances _...assigned to a specific Availability Zone, they provide a capacity reservation... either 1 year or 3 years..._
  * Spot instances _...spare Amazon EC2 computing capacity; AWS can re-claim any time; 2 minute warning..._
  * Dedicated Hosts
*Note:* ...primary difference between the two programs is that Reserved Instances offer a discount against On-Demand pricing depending on committed utilization, whereas Savings Plans offer a discount depending on committed spend.... [link](https://www.cloudhealthtech.com/blog/reserved-instances-vs-aws-saving-plans)

* Amazon EC2 **Auto Scaling** (2)
  * dynamic scaling - _responds to changing demand_
  * predictive scaling - _automatically schedules...based on predicted demand_
* Elastic Load Balancing (**ELB**) - _Regional_ level
* Messaging and queuing
  * **loosely coupled** _...an architecture where if one component fails, it is isolated and therefore won't cause cascading failures throughout the whole system..._
  * Simple Queue Service (**SQS**) - a message queuing service; _...fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless application..._; data in message='payload'
  * Simple Notification Service (**SNS**) - a publish/subscribe service; _...messaging service for both application-to-application (A2A) and application-to-person (A2P) communication..._
* AWS **Lambda** - _serverless compute service_; run time <15min
* Amazon Elastic Container Service (Amazon **ECS**) - _...a container management system..._
* Amazon Elastic Kubernetes Service (Amazon **EKS**) - _... a fully managed service that you can use to run Kubernetes on AWS..._
* Amazon **Fargate** - _...serverless compute engine for containers. It works with both Amazon ECS and Amazon EKS..._

* [Overview Compute Services](https://aws.amazon.com/products/compute/)
  * Instances (Virtual machines)
  * Containers
  * Serverless
  * Edge and Hybrid

- [ ] **TODO** Difference between ECS and EKS
- [ ] **TODO** Understand Fargate better
  
### Module 3

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

### Module 4

* Amazon Virtual Private Cloud (**VPC**) - logically isolated (network) section; essentially your own private network in AWS
* **Internet gateway** - to allow public traffic from the internet to access your VPC
* **Virtual private gateway** - enables you to establish a virtual private network (VPN) connection between your VPC and a private network
* **AWS Direct Connect**  - a service that enables establishing a dedicated private connection between your DC and a VPC; need to work with a Direct Connect partner
* _Note:_ ...a VPC can have multiple types of gateways attached ...

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

### Module 5

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
Volumes EC2 instance attached	|	Multiple instances can read/write
AZ level resource; need be same AZ as EC2 instance		|	Regional resource
Volumes to not automatically scale |	Automatically scales


* Amazon Relational Database Service (Amazon **RDS**) - managed service that enables you to run relational databases in the AWS Cloud.
* RDS services includes: automated patching, backups, redundancy, failover, disaster recovery
* Amazon RDS is available on six database engines
  * MySQL
  * PostgreSQL
  * MariaDB
  * Oracle
  * Microsoft SQL Server
* Amazon **Aurora** - MySQL and PostgreSQL-compatible relational database built for the cloud (replicates six copies to three AZs; continuously backs up data to S3)






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
