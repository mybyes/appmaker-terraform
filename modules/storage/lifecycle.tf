resource "aws_s3_bucket_lifecycle_configuration" "appmaker_fe" {
  bucket = aws_s3_bucket.appmaker_fe.id

  rule {
    id     = "delete-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}

