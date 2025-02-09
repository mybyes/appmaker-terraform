variable "s3_bucket_name" {
  description = "The name of the S3 bucket to store Terraform state"
  type        = string
  default     = "appmaker-terraform-state"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-state-lock"
}

