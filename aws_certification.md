> *Quick links:* \
> [AWS Whitepapers](https://aws.amazon.com/whitepapers/) \
> [AWS Documentation](https://docs.aws.amazon.com/index.html) 

## AWS Cloud Practitioner Essentials 

### Module 1
#### Additional resources / Links 
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
  * Reserved Instances _...assigned to a specific Availability Zone, they provide a capacity reservation..._
  * Spot instances _...spare Amazon EC2 computing capacity; AWS can re-claim any time; 2 minute warning..._
  * Dedicated Hosts 
* Amazon EC2 **Auto Scaling** (2)
  * dynamic scaling - _responds to changing demand_
  * predictive scaling - _automatically schedules...based on predicted demand_ 
* Elastic *Load Balancing* (ELB) - _Regional_ level
* Messaging and queuing
  * **loosely coupled** _...an architecture where if one component fails, it is isolated and therefore won't cause cascading failures throughout the whole system..._
  * Simple Queue Service (SQS) - a message queuing service; _... fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless application..._; data in message='payload'
  * Simple Notification Service (SNS) - a publish/subscribe service; _...messaging service for both application-to-application (A2A) and application-to-person (A2P) communication..._
  
*Note:* ...primary difference between the two programs is that Reserved Instances offer a discount against On-Demand pricing depending on committed utilization, whereas Savings Plans offer a discount depending on committed spend.... [link](https://www.cloudhealthtech.com/blog/reserved-instances-vs-aws-saving-plans)


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

Read Whitepapers initially (top 3), study thoroughly when preparing for exam.
Additional ones: bottom three; at a later stage but also fundamental.

#### Videos
* AWS Event Videos
* Suggested video: Another Day, Another Billion Packets

#### AWS Architecture Center
* https://aws.amazon.com/architecture

#### AWS Answers
* https://aws.amazon.com/answers/

