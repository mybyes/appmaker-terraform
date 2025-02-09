variable "lambda_package_path" {
  description = "Path to the Lambda function deployment package (ZIP file)"
  type        = string
}

variable "db_secret_arn" {
  description = "ARN of the Secrets Manager secret storing DB credentials"
  type        = string
}

