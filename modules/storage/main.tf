module "s3" {
  source = "./s3"
  
  bucket_name = var.s3_bucket_name
}

module "cloudfront" {
  source = "./cloudfront"

  s3_bucket_name = module.s3.s3_bucket_name
  s3_origin_id   = module.s3.s3_origin_id
  s3_bucket_arn  = module.s3.s3_bucket_arn
}
