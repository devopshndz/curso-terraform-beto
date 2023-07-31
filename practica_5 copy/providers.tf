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

