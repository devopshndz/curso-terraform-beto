locals {
    sufix = "${var.tags.project}-${var.tags.env}-${var.tags.region}" # recurso-proyecto-environment-region
    s3-sufix = "${var.tags.project}-${random_string.sufijo-s3.id}" # proyecto-sufijo random, esto para que nos agregue letras al azar (8) y que agregue una nombre de bucket unico
}

# add random_string para ayudarnos a crear un nombre al bucket s3
resource "random_string" "sufijo-s3" {
  length = 8 # longitud
  special = false # que utilice caracteres normales
  upper = false # solamente use minusculas ya que s3 solo maneja nombres en minusculas
}
