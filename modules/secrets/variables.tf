variable "secret_name" {
  description = "Name of the secret in AWS Secrets Manager"
  type        = string
  default     = "appmaker_db_credentials"
}
