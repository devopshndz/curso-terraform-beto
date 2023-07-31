# Creación de una VPC en AWS
resource "aws_vpc" "vpc_virginia" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "VPC_Virginia"
    env = "dev"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Name = "VPC_Ohio"
    env = "dev"
  }
  provider = aws.ohio # Llamamos al provider que tiene el alias de ohio configurado en provider.tf
}