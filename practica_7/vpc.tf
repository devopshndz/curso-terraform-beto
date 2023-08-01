# Creación de una VPC en AWS
resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC_Virginia"
  }
}

# add subnet publica 
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id 
  cidr_block = var.subnets[0] 
  map_public_ip_on_launch = true
  tags = {
    Name = "Public_subnet"
  }
}
# add subnet private
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1] 
  tags = {
    Name = "Private_subnet"
  }
}

# Creación instancia EC2 utilizando VPC y outputs
