resource "aws_s3_bucket" "cerberus_bucket" {
  bucket = var.bucket_name # usamos las variables dentro del modulo
}