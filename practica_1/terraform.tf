resource "local_file" "productos" {
  content  = "Lista de productos para el mes proximo" #parametro
  filename = "productos.txt"                          #parametro, path donde queremos que crear el archivo, será en el mismo directorio
}

# Para ejecutar, abrimos la terminal en el directorio en donde están los archivos de terraform. el init solo se hace la primera vez o cuando agregan un nuevo plugin o un nuevo provider que no se tenía.
# terraform init --> inicialización del proyecto en terraform
# terraform plan --> realizará un plan de que recursos va a crear, + crear - eliminar, ~ modificar
# terraform apply --> aplica los cambios previstos en el plan
# al realizar el apply para este ejemplo, creará un archivo productos.txt en donde el contenido será "Lista de productos"
# terraform show --> ver los recursos que terraform creó 
# terraform destroy --> destruye los recursos creados 
