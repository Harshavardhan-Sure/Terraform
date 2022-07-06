
variable "region" {
  default = "us-west-2"
}
variable "vpc_name" {
  default = "Harsha-VPC"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}
variable "vpc_tendency" {
  default = "default"
}
variable "public_subnet_name" {
  default = "PublicSubnet"
}

variable "private_subnet_name" {
  default = "PrivateSubnet"
}

variable "envs" {
  type    = list(any)
  default = ["dev", "prd"]
}


data "aws_availability_zones" "available" {}




variable "public_subnet_cidr" {
  type    = list(any)
  default = ["10.10.0.0/25", "10.10.0.128/25", "10.10.1.0/25", "10.10.1.128/25"]
}

variable "private_subnet_cidr" {
  type    = list(any)
  default = ["10.10.2.0/25", "10.10.2.128/25", "10.10.3.0/25", "10.10.3.128/25"]
}

variable "ami_id" {
  default = "ami-098e42ae54c764c35"
}
variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "keypair-day2"
}

variable "public_ec2_name" {
  default = "Harsha-Public-EC"
}
variable "private_ec2_name" {
  default = "Harsha-Private-EC"
}
