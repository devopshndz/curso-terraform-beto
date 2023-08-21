resource "aws_s3_bucket" "cerberus_bucket" {
  bucket = local.s3-sufix
}

# como los nombres de los buckets tienen que ser unicos en el mundo debemos ser cuidadosos. vamos a ayudarnos con locals.
