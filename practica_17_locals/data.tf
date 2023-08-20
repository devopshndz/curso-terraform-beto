### Archivo destinado para los boques de data de terraform
data "aws_key_pair" "key" {
    key_name = "beto_prueba"
}

# estamos creando una referencia en terraform de la llave creada de nombre beto_prueba. 
# Esta llave no fue creada en terraform, ya está creada en nuestra cuenta de aws, y de esta forma la vamos a utilizar en nuestro código.
