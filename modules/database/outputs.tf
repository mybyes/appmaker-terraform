output "db_instance_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.appmaker_sql_db.endpoint
}

output "db_security_group_id" {
  value = aws_security_group.appmaker_db_sg.id
}

output "db_instance_id" {
  value = aws_db_instance.rds.id
}
