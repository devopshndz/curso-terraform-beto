output "s3_bucket_arn" {
  value = aws_s3_bucket.cerberus_bucket.arn # llamar el arn del bucket de s3
}