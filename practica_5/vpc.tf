# Creación de una VPC en AWS
resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC_Virginia"
    env = "dev"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr
  tags = {
    Name = "VPC_Ohio"
    env = "dev"
  }
  provider = aws.ohio # Llamamos al provider que tiene el alias de ohio configurado en provider.tf
}