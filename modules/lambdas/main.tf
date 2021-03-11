module "buckets" {
  source = "../s3"
}
# --------------------------------------------------- lambda fn

resource "aws_lambda_function" "rhassan_test" {
    #this lambda will use the code uploaded in s3 bucket. so this deployment depends on s3 bucket
    depends_on = [module.buckets]
    function_name = "${var.prefix}-${var.function_name}"
    role = "arn:aws:iam::${var.SandboxAWSAccountID}:role/${var.prefix}-${var.role_name}"
    runtime = "python3.7"
    handler = "test.handler"
    filename = "${path.module}/../../tasks/test.zip"
    # the below scode works for uplaoding zip file to S3. 
    # s3_bucket = "dev-rhassan-testing"
    # s3_key = "test.zip"
    # description = "lambda for testing"
    # vpc_config {
    #       subnet_ids         = [module.rizbi.rizbi_subnet]
    #       security_group_ids = [module.rizbi.rizbi_security_group_id]
    # } 
}

resource "aws_cloudwatch_log_group" "lambda_log" {
  name              = "/aws/lambda/${var.prefix}-${var.function_name}"
  retention_in_days = 14
}