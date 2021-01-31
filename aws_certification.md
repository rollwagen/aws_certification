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

* **Region** (=separate geographic area) selection criteria (four business factors):
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
