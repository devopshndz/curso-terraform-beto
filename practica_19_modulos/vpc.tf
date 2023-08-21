# Creación de una VPC en AWS
resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC_Virginia-${local.sufix}"
  }
}

# add subnet publica 
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id 
  cidr_block = var.subnets[0] 
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet-${local.sufix}"
  }
}
# add subnet private
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1] 
  tags = {
    Name = "private_subnet-${local.sufix}"
  }
  depends_on = [ 
    aws_subnet.public_subnet
   ]
}

### uso de internet gateway para poder acceder a nuestras instancias
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "igw-vpc-Virginia-${local.sufix}"
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
    Name = "public-crt-${local.sufix}"
  }
}

### asociación de la route table con la subnet
resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id # asociación con la subnet publica
  route_table_id = aws_route_table.public_crt.id # asociacion con la ctr
}

### Security group
resource "aws_security_group" "sg_public_instance" {
  name        = "Public instance SG"
  description = "Allow SSH inbound traffic and ALL egress traffic"
  vpc_id      = aws_vpc.vpc_virginia.id

  # bloque dinamico para el manejo de puertos en el security group
  dynamic "ingress" {
    for_each = var.ingress_port_list
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [var.sg_ingress_cidr]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-tls-${local.sufix}"
  }
}

# llamada del modulo de s3 creado
module "mybucket" {
  source = "./modulos/s3"
  bucket_name = "n0mbreunico345" # la variable creada en las variables del modulo s3
}

output "s3_arn" {
  value = module.mybucket.s3_bucket_arn
}