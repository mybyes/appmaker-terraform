resource "aws_s3_bucket" "appmaker_fe" {
  bucket = var.s3_bucket_name
  force_destroy = true
}


