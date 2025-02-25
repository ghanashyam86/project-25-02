data "aws_availability_zones" "available" {}

resource "aws_instance" "public-instance" {
  count                   = 3
  ami                     = data.aws_ami.amzn_linux2.id
  instance_type           = "t2.micro"
  subnet_id               = aws_subnet.public_subnet[count.index].id
  vpc_security_group_ids  = [aws_security_group.vpc-demo-security-groups.id]
  key_name                = "ohio-83"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  associate_public_ip_address = true
  tags = {
      Name = "Public-server-${count.index + 1}"
  }
}
