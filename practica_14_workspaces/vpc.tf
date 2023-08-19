# Creación de una VPC en AWS
resource "aws_vpc" "vpc_virginia" {
  #cidr_block = var.virginia_cidr
  cidr_block = lookup(var.virginia_cidr,terraform.workspace) # con el lookup, dependiendo en que workspace estamos trabajando, terraform trabajara con el cidr que corresponda
  tags = {
    Name = "VPC_Virginia"
  }
}

# add subnet publica 
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}
# add subnet private
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "private_subnet"
  }
  depends_on = [
    aws_subnet.public_subnet
  ]
}
### Necesitamos conectarnos a la instancia para poder trabajar con ella. para ello necesitamos varios recursos

### uso de internet gateway para poder acceder a nuestras instancias
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "igw vpc Virginia"
  }
}

### Uso de route tables o tablas de enrutamiento para salir a internet
resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id # lo asociamos con nuestra vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id # lo asociamos con nuestro igw
  }

  tags = {
    Name = "public crt"
  }
}

### asociación de la route table con la subnet
resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id   # asociación con la subnet publica
  route_table_id = aws_route_table.public_crt.id # asociacion con la ctr
}
# con esto ya nos estamos asegurando tener conectividad hacia internet y desde.
# pero falta asociar un security group a la instancia para que esta ahora si pueda acceder a internet por medio de su sg

### Security group
resource "aws_security_group" "sg_public_instance" {
  name        = "Public instance SG"
  description = "Allow SSH inbound traffic and ALL egress traffic"
  vpc_id      = aws_vpc.vpc_virginia.id

  ingress {
    description = "SSH over Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}