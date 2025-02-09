resource "aws_secretsmanager_secret" "db_credentials" {
  name = var.secret_name
}

resource "aws_secretsmanager_secret" "db_secret" {
  // ...existing code...
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = random_string.db_username.result
    password = random_password.db_password.result
  })
}

# Generate a random username
resource "random_string" "db_username" {
  length  = 8
  special = false
  upper   = false
}

# Generate a secure random password
resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!@#$%&*()-_=+[]{}<>:?/"
}



