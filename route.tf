# public-route table

resource "aws_route_table" "public_rt" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-igw.id
  }

  tags = {
     Name = "public-rt"
  }
}

# route table association

resource "aws_route_table_association" "public-rt-asso" {
   count = length(aws_subnet.public_subnet)
   subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
   route_table_id = aws_route_table.public_rt.id
}



#######  private route table ########
/*
resource "aws_route_table" "private_rt" {
   vpc_id = module.vpc.vpc_id

   route {
     cidr_block = "0.0.0.0/0"
     nat_gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
     Name = "private-rt"
 }
}*/
# private route table association
/*
resource "aws_route_table_association" "private-rt-asso" {
    count = length(aws_subnet.private_subnet)
    subnet_id = element(aws_subnet.private_subnet[*].id, count.index)
    route_table_id = aws_route_table.private_rt.id
}*/
