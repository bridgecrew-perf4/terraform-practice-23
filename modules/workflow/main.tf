
module "lambdas" {
  source = "../lambdas"
}

resource "aws_iam_role" "rhassan_role_step_fn" {
  name = "${var.prefix}-${var.step_fn_role_name}-step_fn"
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
          "lambda.amazonaws.com",
          "states.amazonaws.com"
        ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = var.step_fn_role_name
  role_arn = aws_iam_role.rhassan_role_step_fn.arn

  definition = <<EOF
{
  "Comment": "A Hello World example of the Amazon States Language using an AWS Lambda Function",
  "StartAt": "HelloWorld",
  "States": {
    "HelloWorld": {
      "Type": "Task",
      "Resource": "${module.lambdas.step_fn_lambda_arn}",
      "End": true
    }
  }
}
EOF
}