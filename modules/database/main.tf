resource "aws_db_instance" "appmaker_sql_db" {
  identifier             = var.db_identifier
  engine                 = var.db_engine
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  storage_type           = var.db_storage_type
  db_name                = var.db_name
  db_subnet_group_name   = var.db_subnet_group
  vpc_security_group_ids = [var.db_security_group]
  manage_master_user_password = true

  master_user_secret {
    secret_arn = var.db_secret_arn # Fetch credentials from Secrets Manager
  }

  skip_final_snapshot = var.db_skip_final_snapshot
}
