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
                "ec2:DetachVolume"
            ],
            "Resource": [
                "arn:aws:ec2:*:*:volume/*",
                "arn:aws:ec2:*:*:instance/*"
            ],
            "Condition": {
                "ArnEquals": {"ec2:SourceInstanceARN": "arn:aws:ec2:*:*:instance/instance-id"}
            }
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
# define a zip archive
data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = "output_code.zip"
  source_content_filename = "test.zip"
	# ... define the source
}

resource "aws_lambda_function" "rhassan_test" {
    function_name = "${var.prefix}-${var.function_name}"
    role = aws_iam_role.lambda_role.arn
    runtime = "python3.7"
    handler = "test"
    #filename, s3_* or image_uri attributes must be set
    filename = data.archive_file.lambda_zip.output_path
}