variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name for CloudFront"
  type        = string
}

variable "s3_origin_id" {
  description = "Origin ID for CloudFront"
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}
