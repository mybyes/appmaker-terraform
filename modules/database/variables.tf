variable "db_identifier" {
  description = "Unique identifier for the RDS instance"
  type        = string
  default     = "appmaker-sql-db"
}

variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "db_instance_class" {
  description = "Instance type for the RDS database"
  type        = string
  default     = "db.t3.micro" # Free Tier
}

variable "db_allocated_storage" {
  description = "Allocated storage for the RDS database"
  type        = number
  default     = 20
}

variable "db_storage_type" {
  description = "Storage type for the RDS database"
  type        = string
  default     = "gp2"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "appmaker_db"
}

variable "db_subnet_group" {
  description = "Database subnet group name"
  type        = string
}

variable "db_security_group" {
  description = "Security group ID for the database"
  type        = string
}

variable "db_secret_arn" {
  description = "Secrets Manager ARN for database credentials"
  type        = string
}

variable "db_skip_final_snapshot" {
  description = "Whether to skip final snapshot on deletion"
  type        = bool
  default     = true
}


variable "vpc_id" {
  description = "VPC ID where the RDS instance is deployed"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks for database access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
