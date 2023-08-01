# Creación de una VPC en AWS
resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC_Virginia"
    env = "dev"
  }
}
# # add subnet publica 
# resource "aws_subnet" "public_subnet" {
#   vpc_id = aws_vpc.vpc_virginia.id # output de la vpc
#   cidr_block = var.public_subnet # la subnet public debe poder asignar ips publicas
#   map_public_ip_on_launch = true # con esta variable le estamos indicando que se asigne ips publicas

# }

# # add subnet private
# resource "aws_subnet" "private_subnet" {
#   vpc_id = aws_vpc.vpc_virginia.id
#   cidr_block = var.private_subnet 
# }

# uso de listas para agregar subnets:
# add subnet publica 
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id 
  cidr_block = var.subnets[0] 
  map_public_ip_on_launch = true
  tags = {
    Name = "Public subnet"
    name = "prueba"
    env = "dev"
  }

}

# add subnet private
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1] 
  tags = {
    Name = "Private subnet"
    name = "prueba"
    env = "dev"
  }
}