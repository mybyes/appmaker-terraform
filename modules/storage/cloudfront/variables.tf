variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "s3_origin_id" {
  description = "S3 origin ID for CloudFront"
  type        = string
}

variable "s3_bucket_arn" {
  description = "S3 bucket ARN"
  type        = string
}
