variable "region" {
  default = "us-east-1"
}

variable "bucket_name" {
  default = "my-serverless-frontend"
}

variable "lambda_runtime" {
  default = "nodejs18.0"
}

variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}


variable "db_username" {
  description = "Database username stored securely in AWS Secrets Manager"
  type        = string
}

variable "db_password" {
  description = "Database password stored securely in AWS Secrets Manager"
  type        = string
  sensitive   = true
}


variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks for database access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}
