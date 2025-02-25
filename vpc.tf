# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.2.0"

  # VPC Basic Details
  name = "${var.vpc_name}"
  cidr = var.cidr_block
  azs  = var.vpc_azs

 }
