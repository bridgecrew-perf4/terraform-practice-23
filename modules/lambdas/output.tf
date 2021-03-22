output "step_fn_lambda_invoke_arn" {
  value = aws_lambda_function.rhassan_test.invoke_arn
}

output "step_fn_lambda_arn" {
  value = aws_lambda_function.rhassan_test.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.rhassan_test.function_name
}