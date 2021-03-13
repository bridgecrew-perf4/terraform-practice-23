output "sqs_arn" {
  value = aws_sqs_queue.rhassan_queue.arn
}
output "sqs_id" {
  value = aws_sqs_queue.rhassan_queue.id
}