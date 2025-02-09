output "subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "vpc_id" {
  value = aws_vpc.appmaker_vpc.id
}

output "db_subnet_group" {
  value = aws_db_subnet_group.appmaker_subnet_group.id
}

output "db_security_group" {
  value = aws_security_group.appmaker_db_sg.id
}
