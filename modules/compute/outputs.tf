output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.appmaker_be.arn
}

output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.appmaker_be.function_name
}

