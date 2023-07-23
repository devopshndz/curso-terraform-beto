# creación bucket s3 aws
resource "aws_s3_bucket" "provedores" {
  count = 6
  bucket = "proveedores-${random_string.sufijo[count.index].id}"
  tags = {
    Owner = "Alberto"
    Environment = "Dev"
    Office = "Proveedores"
  }
}

resource "random_string" "sufijo" {
  count = 6
  length  = 8
  special = false
  upper   = false
  numeric = false
}

# codigo para crear 6 buckets random
# agregamos tags porque en aws es importante trabajar con estos