resource "aws_lambda_function" "appmaker_be" {
  function_name    = "appmaker_be"
  runtime         = "nodejs18.x"
  handler         = "index.handler"
  memory_size     = 128   # Free tier limit
  timeout         = 10     # Optimized for cost
  role            = aws_iam_role.lambda_exec.arn
  s3_bucket       = aws_s3_bucket.lambda_code.id
  s3_key          = "appmaker_be.zip"

  environment {
    variables = {
      DB_SECRET_ARN = var.db_secret_arn
    }
  }
}
