resource "aws_api_gateway_rest_api" "appmaker_api" {
  name        = "appmaker-api"
  description = "API Gateway for AppMaker backend"
}

resource "aws_api_gateway_resource" "tasks" {
  rest_api_id = aws_api_gateway_rest_api.appmaker_api.id
  parent_id   = aws_api_gateway_rest_api.appmaker_api.root_resource_id
  path_part   = "tasks"
}

# POST /tasks - Create Task
resource "aws_api_gateway_method" "post_task" {
  rest_api_id   = aws_api_gateway_rest_api.appmaker_api.id
  resource_id   = aws_api_gateway_resource.tasks.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "post_task_integration" {
  rest_api_id             = aws_api_gateway_rest_api.appmaker_api.id
  resource_id             = aws_api_gateway_resource.tasks.id
  http_method             = aws_api_gateway_method.post_task.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

# GET /tasks - Fetch Tasks
resource "aws_api_gateway_method" "get_task" {
  rest_api_id   = aws_api_gateway_rest_api.appmaker_api.id
  resource_id   = aws_api_gateway_resource.tasks.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_task_integration" {
  rest_api_id             = aws_api_gateway_rest_api.appmaker_api.id
  resource_id             = aws_api_gateway_resource.tasks.id
  http_method             = aws_api_gateway_method.get_task.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

# Deploy API Gateway
resource "aws_api_gateway_deployment" "appmaker_api_deployment" {
  depends_on = [
    aws_api_gateway_integration.post_task_integration,
    aws_api_gateway_integration.get_task_integration
  ]
  
  rest_api_id = aws_api_gateway_rest_api.appmaker_api.id
  stage_name  = "prod"
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.appmaker_api.execution_arn}/*/*"
}

