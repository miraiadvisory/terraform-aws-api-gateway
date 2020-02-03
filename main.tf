data "aws_caller_identity" "current" {}

resource "aws_lambda_permission" "this_permission_0" {
  statement_id  = "AllowExecutionFromAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "apigateway.amazonaws.com"

  # The /*/*/* part allows invocation from any stage, method and resource path
  # within API Gateway REST API.
  source_arn = "${var.execution_arn}/*/*/*"
}

resource "aws_api_gateway_resource" "this" {
  rest_api_id = var.rest_api_id
  parent_id   = var.rest_api_root_id
  path_part   = var.path_part
}

resource "aws_api_gateway_method" "this-GET" {
  rest_api_id          = var.rest_api_id
  resource_id          = aws_api_gateway_resource.this.id
  http_method          = "GET"
  request_validator_id = var.request_parameters_validator_id

  request_parameters = var.request_parameters

  authorization    = "NONE"
  api_key_required = true
}

resource "aws_api_gateway_integration" "this" {
  rest_api_id = var.rest_api_id
  resource_id = aws_api_gateway_method.this-GET.resource_id
  http_method = aws_api_gateway_method.this-GET.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.invoke_arn
}

resource "aws_lambda_permission" "this_permission_1" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${var.rest_api_id}/*/${aws_api_gateway_method.this-GET.http_method}/${var.uri_path}"
}

resource "aws_api_gateway_method_response" "this-200" {
  rest_api_id = var.rest_api_id
  resource_id = aws_api_gateway_resource.this.id
  http_method = aws_api_gateway_method.this-GET.http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "this" {
  depends_on  = [ aws_api_gateway_integration.this ]
  rest_api_id = var.rest_api_id
  resource_id = aws_api_gateway_resource.this.id
  http_method = aws_api_gateway_method.this-GET.http_method
  status_code = aws_api_gateway_method_response.this-200.status_code

  response_templates = {
    "application/json" = ""
  }
}