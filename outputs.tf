# output "sqs_arn" {
#   value = module.sqs.sqs_arn
#   sensitive= true
# }

# output "sqs_id" {
#   value = module.sqs.sqs_id
# }

output "rest_api_id" {
  description = "rest api ID"
  value = module.api-gateway.rest_api_id
}

output "lambda_arn" {
  description = "ARN of lambda"
  value = module.api-gateway.step_fn_lambda_arn
}

output "lambda_name" {
  value = module.api-gateway.lambda_name
}

output "api_method_uri" {
  value= module.api-gateway.api_method_uri
}