resource "random_string" "sufijo" {
  count = 5
  length  = 4
  special = false
  upper   = false
  numeric = false
}

# resource "random_string" "sufijo-2" {
#   length  = 4
#   special = false
#   upper   = false
#   numeric = false
# }

# resource "random_string" "sufijo-3" {
#   length  = 4
#   special = false
#   upper   = false
#   numeric = false
# }

# resource "random_string" "sufijo-4" {
#   length  = 4
#   special = false
#   upper   = false
#   numeric = false
# }

# resource "random_string" "sufijo-5" {
#   length  = 4
#   special = false
#   upper   = false
#   numeric = false
# }

# este código me lo traje desde terraform.terraform 
# para no tener todo el código en un solo archivo terraform.tf o main.tf podemos sacar código y colocarlo en un archivo .tf a parte
# terraform reconoce esto código porque al compilar el código del main busca las referencias que este tiene.
# en este caso random_string se referencia dentro de terraform.tf
# hayq ue tener un balance, no todo en un solo archivo y no todo en varios archivos.

# DRY = Don't repeat yourself
# significa no repetir los procedimientos