module "networking" {
  source             = "./modules/networking"
  aws_region         = var.aws_region
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}


module "secrets" {
  source = "./modules/secrets"
}

module "database" {
  source              = "./modules/database"
  vpc_id              = module.networking.vpc_id  # Pass VPC ID from networking module
  allowed_cidr_blocks = var.allowed_cidr_blocks
  db_identifier       = "appmaker-sql-db"
  db_engine           = "postgres"
  db_instance_class   = "db.t3.micro"
  db_allocated_storage = 20
  db_storage_type     = "gp2"
  db_name             = "appmaker_db"
  db_subnet_group     = module.networking.db_subnet_group
  db_security_group   = module.networking.db_security_group
  db_secret_arn       = module.secrets.db_secret_arn
  db_skip_final_snapshot = true
  }

module "api_gateway" {
  source               = "./modules/api_gateway"
  lambda_function_name = "appmaker_be"
  lambda_invoke_arn    = "arn:aws:lambda:${var.aws_region}:${var.aws_account_id}:function:appmaker_be"
}

module "storage" {
  source                = "./modules/storage"
  s3_bucket_name  = "appmaker-fe"
  s3_bucket_id   = module.storage.s3_bucket_id
  #s3_bucket_arn  = module.storage.s3_bucket_arn
}




