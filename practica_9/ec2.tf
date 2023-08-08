# EC2 desde terraform registry 
resource "aws_instance" "public_instance" {
  ami                     = "ami-0f34c5ae932e6f0e4" # entramos a AWS y buscamos la ami como si fueramos a crear una instancia
  instance_type           = "t2.micro" # ojo, ver cual es la que vas a utilizar. Esta es la free tier
  subnet_id = aws_subnet.private_subnet.id # Usamos la subnet publica que creamos
  key_name = data.aws_key_pair.key.key_name # estructura para usar data en terraform. estamos utilizando la kay_pair creada en aws. la referenciamos en el archivo data.tf
  tags = {
    Name = "Instance_terraform"
  }
  ### uso de lifecycle
  lifecycle {
    create_before_destroy = true #cuando terraform vaya a destruir este recuros para crear uno nuevo primero creará el nuevo recuros y luego destruirá el anterior
    #prevent_destroy = true   Estamos diciendo que este recurso no se va a destruir. Al hacer un plan saldrá un error de que no puede destruir el recurso pero eso está bie, es lo que queremos.
    #ignore_changes = [ ami, subnet_id ]   ignora cambios en recursos. Si por ejemplo, alguien cambia la ami que se está utilizando o la subnet_id estos cambios no serán tomados debido a ignore_changes.
    #replace_triggered_by = [  ] # lista de recursos, que si sufren algun cambio, el plan dirá que se tiene que hacer un cambio y dira que tiene que destruir y construir la instanacia o el recursos nuevamente.
    #Si tienes recuros que están interconectados es importante esto porque los haces interconectarse 
  }
}

# Vamos a usar outputs, creamos un archivo output.tf
# colocamos key_name (documentación de aws_instance) para poder utilizar en la intancia ec2 la llave beto_prueba creada en aws

