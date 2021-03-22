
locals {
  common_tags = {
    Name = "Rizbi"
    roll = 1009003
  }
}
resource "aws_sqs_queue" "rhassan_queue" {
  # name = var.sqs_name_list[count.index]
  name = "test_queue"
  delay_seconds             = 0
  max_message_size          = 2048
  message_retention_seconds = 345600  #4 days
  receive_wait_time_seconds = 0
  # count=                     1
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

# # ----------------- testing conditional expression-------------------------
# resource "aws_sqs_queue" "rhassan_queue_condition_dev" {
#   name = var.sqs_name_list[0]
#   # if env= true, it will create this resource 1 time
#   count                     = var.env == true ? 1 : 0
#   tags                      = local.common_tags
#   delay_seconds             = 0
#   max_message_size          = 2048
#   message_retention_seconds = 345600 #4 days
#   receive_wait_time_seconds = 0
#   policy                    = <<EOF


# {
#   "Version": "2012-10-17",
#   "Id": "SQSAllowPolicy",
#   "Statement": [
#     {
#       "Sid": "SQSAllowID",
#       "Effect": "Allow",
#       "Principal": "*",
#       "Action": "SQS:*",
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }

# resource "aws_sqs_queue" "rhassan_queue_condition2_it" {
#   name = var.sqs_name_list[1]
#   # if env= false, it will create this resource 1 time
#   count                     = var.env == false ? 1 : 0
#   delay_seconds             = 0
#   tags                      = local.common_tags
#   max_message_size          = 2048
#   message_retention_seconds = 345600 #4 days
#   receive_wait_time_seconds = 0
#   policy                    = <<EOF

# {
#   "Version": "2012-10-17",
#   "Id": "SQSAllowPolicy",
#   "Statement": [
#     {
#       "Sid": "SQSAllowID",
#       "Effect": "Allow",
#       "Principal": "*",
#       "Action": "SQS:*",
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }