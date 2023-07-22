resource "local_file" "productos" {
  content  = "Lista de productos para el mes proximo"   #parametro
  filename = "productos-${random_string.sufijo.id}.txt" #parametro, path donde queremos que crear el archivo, será en el mismo directorio
}

resource "random_string" "sufijo" {
  length  = 4
  special = false
  upper   = false
  numeric = false
}

# Al agregar un nuevo recurso, se debe volver a lanzar el terraform init ya que tiene en este caso un nuevo provider
# terraform show --> ver los recursos que terraform creó 