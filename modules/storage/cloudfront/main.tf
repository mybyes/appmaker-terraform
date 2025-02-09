resource "aws_cloudfront_distribution" "appmaker_cf" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name = "${var.s3_bucket_name}.s3.amazonaws.com"
    origin_id   = var.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}



