resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC_Virginia"
    name = "prueba"
    env = "dev"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr
  tags = {
    Name = "VPC_Ohio"
    name = "prueba"
    env = "dev"
  }
  provider = aws.ohio
}