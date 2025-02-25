#vi subnets.tf

resource "aws_subnet" "public_subnet" {
   count = length(var.public_subnets)
   vpc_id = module.vpc.vpc_id
   cidr_block = element(var.public_subnets, count.index)
   availability_zone = element(data.aws_availability_zones.available.names, count.index)
   tags = {
      Name = "Public-subnet-${count.index + 1}"
   }
}

resource "aws_subnet" "private_subnet" {
   count = length(var.private_subnets)
   vpc_id = module.vpc.vpc_id
   cidr_block = element(var.private_subnets, count.index)
   availability_zone = element(data.aws_availability_zones.available.names, count.index)
   tags = {
      Name = "Private-subnet-${count.index + 1}"
   }
}
