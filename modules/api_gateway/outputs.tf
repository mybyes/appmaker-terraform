output "api_gateway_url" {
  description = "API Gateway Invoke URL"
  value       = aws_api_gateway_deployment.appmaker_api_deployment.invoke_url
}

