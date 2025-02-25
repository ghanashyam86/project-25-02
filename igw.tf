# igw-nat.tf

resource "aws_internet_gateway" "demo-igw" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "my-demo-vpc-igw"
  }
}
