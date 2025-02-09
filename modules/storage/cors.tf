resource "aws_s3_bucket" "appmaker_fe" {
  // ...existing code...
}

resource "aws_s3_bucket_cors_configuration" "appmaker_fe" {
  bucket = aws_s3_bucket.appmaker_fe.id

  cors_rule {
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    allowed_headers = ["*"]
  }
}

