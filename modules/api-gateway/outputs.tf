output "rest_api_id" {
  description = "rest api ID"
  value = aws_api_gateway_rest_api.api.id
}

output "api_method_uri" {
  value = aws_api_gateway_integration.integration.uri
}

output "step_fn_lambda_arn" {
  value = module.lambdas.step_fn_lambda_arn
}
output "lambda_name" {
  value = module.lambdas.lambda_function_name
}

variable "region" {
  default = "us-west-2"
}
variable "SandboxAWSAccountID" {
  default = "546607823400"
}