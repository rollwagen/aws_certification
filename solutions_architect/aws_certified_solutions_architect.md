# aws - training and certification

## Domain1: Design Resilient Architectures / 1.1 Design a multi-tier architecture solution

From AWS learning:

1. Determinme how to design a **multi-tier** architecture solution
2. Determinme how to design **high available** and/or _fault tolerant_ solutions
3. Determinme how to design **decoupling** mechanisms using AWS services
4. Choose **reliable/resilient storage**

### Resilient VPC Architectures

#### AWS Networking & VPCs

* [AWS Networking Fundementals (re:invent 2019](https://www.youtube.com/watch?v=hiKPPy584Mg&t=96s)
* [Amazon Virtual Private Cloud User Guide](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html)

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
  * can peer **across regtions** and **across accounts**
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

* **VPC Endpoints** - _enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by AWS PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. Instances in your VPC do not require public IP addresses to communicate with resources in the service. Traffic between your VPC and the other service does not leave the Amazon network._
  * Gateway endpoint (Gateway VPC endpoint) - used purely for S3 and Dynamo DB
  * Interface endpoint (Interface VPC endpoint) - to connect to 'AWS Service APIs'
    * VPC endpoint services (AWS PrivateLink)
  * Gateway Load Balancer endpoint

* **AWS VPN**
  * always two IPSec tunnels, in two different Availability Zones for high-availability
  * can use a transit gateway or virtual private gateway as the gateway for the Amazon side of the Site-to-Site VPN connection

1.2 Design highly available and/or fault-tolerant architectures
1.3 Design decoupling mechanisms using AWS services
1.4 Choose appropriate resilient storag

* EC2 Instance store -  disk type and capacity depends on instanct type