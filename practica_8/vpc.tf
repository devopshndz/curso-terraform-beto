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
    Name = "public_subnet"
  }
}
# add subnet private
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1] 
  tags = {
    Name = "private_subnet"
  }
  depends_on = [ 
    aws_subnet.public_subnet # con depends_on especificamos que el recurso private_subnet depende del recurso public_subnet
                             # terraform primero tiene que desplegar la public_subnet para desplegar la private_subnet
   ]
}

# el --target se utiliza cuando se han hecho cambios en el codigo pero uno no quiere cambiar todas las cosas, solo alguna.
