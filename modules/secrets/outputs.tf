# No need for db_username and db_password as we generate them dynamically
output "db_secret_arn" {
  description = "ARN of the Secrets Manager secret"
  value       = aws_secretsmanager_secret.db_secret.arn
}

output "db_credentials" {
  description = "Database credentials from Secrets Manager"
  value       = jsondecode(data.aws_secretsmanager_secret_version.db_secret_version.secret_string)
  sensitive   = true
}
