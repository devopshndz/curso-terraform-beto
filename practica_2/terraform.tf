resource "local_file" "productos" {
  count = 5 # con count queremos que cree este recurso 5 veces y no reptir el código que se comentó abajo
  content  = "Lista de productos para el mes proximo"   #parametro
  filename = "productos-${random_string.sufijo[count.index].id}.txt" #parametro, path donde queremos que crear el archivo, será en el mismo directorio
}
# colocamos sufijo[count.index] ya que terraform en su inteligencia asume que el conteo de sufijo se le agg un [] y dentro el numero del sufijo



# resource "local_file" "productos-2" {
#   content  = "Lista de productos para el mes proximo"   
#   filename = "productos-${random_string.sufijo-2.id}.txt" 
# }

# resource "local_file" "productos-3" {
#   content  = "Lista de productos para el mes proximo"   
#   filename = "productos-${random_string.sufijo-3.id}.txt" 
# }

# resource "local_file" "productos-4" {
#   content  = "Lista de productos para el mes proximo"   
#   filename = "productos-${random_string.sufijo-4.id}.txt" 
# }

# resource "local_file" "productos-5" {
#   content  = "Lista de productos para el mes proximo"   
#   filename = "productos-${random_string.sufijo-5.id}.txt" 
# resource "random_string" "sufijo" {
#   length  = 4
#   special = false
#   upper   = false
#   numeric = false
# }

# Al agregar un nuevo recurso, se debe volver a lanzar el terraform init ya que tiene en este caso un nuevo provider
# terraform show --> ver los recursos que terraform creó 