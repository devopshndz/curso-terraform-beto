terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=4.36.0, <4.47.0, !=4.43.0" # constraint >= (mayor o igual), < (menor) y != (distinta)
    }
  }
  required_version = "~>1.5.0" # constraint ~> significa que cualquier versión mayor o igual a la 1.5.0 se podrá utilizar (pero solo dentro de la 1.5)
}

provider "aws" {
    region = "us-east-1" # region en donde trabajaremos
}

provider "aws" {
    region = "us-east-2" # region en donde trabajaremos
    alias = "ohio" # El alias nos permite darle un nombre a un provider y poder realizar despligues a este provider
}

# Contexto:
# Los providers aquí colocados se utilizan para poder decir a terraform en donde vamos a desplegar nuestros recursos
# Usamos constraints (<,>,<=,>=,~>,!=) para especificar y controlar las versiones a utilizar
# Usamos alias para poder establecer una variable que haga referencia a una provider cuando se están utilizando mas de 2
# el provider que no tenga alias será el provider por default en donde se desplegará todo lo que apliquemos en terraform.
# para llamar este provider con alias, nos vamos al recurso y antes de cerrar el ultimo } colocamos provider = aws.<alias>
