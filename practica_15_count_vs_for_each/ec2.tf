# Despliegue de multiples instancias con count -->
# resource "aws_instance" "public_instance" {
#   count                  = length(var.instancias) # length de longitud. le pasamos la lista de instancias, el count tomará esta lista.
#   ami                    = var.ec2_specs.ami
#   instance_type          = var.ec2_specs.instance_type
#   subnet_id              = aws_subnet.public_subnet.id
#   key_name               = data.aws_key_pair.key.key_name
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]

#   tags = {
#     Name = var.instancias[count.index] # llamamos la variable instancia y va a ir contando cada posicion de la instancia.
#   }
# }


# despliegue de instancias con for_each -->
# trabajar con map o set, no con list
resource "aws_instance" "public_instance" {
  for_each               = var.instancias # llamamos la variable de instacias que es de tipo set
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]

  tags = {
    Name = each.value # como estamos utilizando for_each, llamamos la iteracion con each.value que es el resultado de cada iteracion que realiza
  }
}
