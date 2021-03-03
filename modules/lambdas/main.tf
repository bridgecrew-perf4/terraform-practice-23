resource "aws_iam_role" "lambda_role" {
    name = "${var.prefix}-${var.role_name}-lambda"
    tags = {
    "Project" = "ORCA"
    "Account" = "dev"
    }
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com"
        ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_policy" {
    name = "lambda-role-policy"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:AttachVolume",
        "ec2:DetachVolume",
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}
# --------------------------------------------------- lambda fn

resource "aws_lambda_function" "rhassan_test" {
    function_name = "${var.prefix}-${var.function_name}"
    role = aws_iam_role.lambda_role.arn
    runtime = "python3.7"
    handler = "test.handler"
    #filename, s3_* or image_uri attributes must be set
    # filename = "test.zip"
    # the below scode works for uplaoding zip file to S3. 
    s3_bucket = "dev-rhassan-testing"
    s3_key = "test.zip"
    description = "lambda for testing"
}

resource "aws_cloudwatch_log_group" "lambda_log" {
  name              = "/aws/lambda/${var.prefix}-${var.function_name}"
  retention_in_days = 14
}