#vi variables.tf
variable "vpc_name" {
   type = string
   default = "first-vpc"
}

variable "cidr_block" {
   type = string
   default = "10.10.0.0/16"
}


variable "vpc_azs" {
   type = list(string)
   default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}


variable "public_subnet_NAT" {
    type = string
    default = "10.10.7.0/24"
 }


variable "public_subnets" {
    type = list(string)
    default = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
}

variable "private_subnets" {
    type = list(string)
    default = ["10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]
}

variable "vpc_igw" {
    type = bool
    default = true
}

variable "aws_region" {
     type = string
     default = "us-east-2"
}
