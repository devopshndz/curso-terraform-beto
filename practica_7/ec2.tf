# EC2 desde terraform registry 
resource "aws_instance" "public_instance" {
  ami                     = "ami-0f34c5ae932e6f0e4" # entramos a AWS y buscamos la ami como si fueramos a crear una instancia
  instance_type           = "t2.micro" # ojo, ver cual es la que vas a utilizar. Esta es la free tier
  subnet_id = aws_subnet.public_subnet.id # Usamos la subnet publica que creamos
  tags = {
    Name = "Instance_terraform"
  }
}

# Vamos a usar outputs, creamos un archivo output.tf

