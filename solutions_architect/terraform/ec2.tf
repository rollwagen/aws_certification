terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region                  = "eu-central-1"
  shared_credentials_file = "~/.aws/credentials"
}


resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_internet_gateway" "my-internet-gateway" {
  vpc_id = aws_vpc.my-vpc.id
}

resource "aws_route" "my-route" {
  route_table_id            = aws_vpc.my-vpc.main_route_table_id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.my-internet-gateway.id
}

resource "aws_security_group_rule" "example" {
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_vpc.my-vpc.default_security_group_id
}

resource "aws_instance" "my-ec2-instance" {
  ami           = "ami-0b8cd61e48f1cfc2b"
  instance_type = "t4g.micro"
  #ami           = "ami-0932440befd74cdba"
  #instance_type = "t2.micro"
  associate_public_ip_address = "true"
  key_name = "id_rsa.pub"
  subnet_id = aws_subnet.my-subnet.id
}
