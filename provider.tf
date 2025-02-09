provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "appmaker-terraform-state"
    key            = "appmaker/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

