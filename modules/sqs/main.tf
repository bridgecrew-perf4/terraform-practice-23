resource "aws_sqs_queue" "rhassan_queue" {
  name = var.sqs_name_list[count.index]
  delay_seconds             = 0
  max_message_size          = 2048
  message_retention_seconds = 345600  #4 days
  receive_wait_time_seconds = 0
  count = 3
  policy = <<EOF

{
  "Version": "2012-10-17",
  "Id": "SQSAllowPolicy",
  "Statement": [
    {
      "Sid": "SQSAllowID",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:*",
      "Resource": "*"
    }
  ]
}
EOF
}
