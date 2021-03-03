resource "aws_s3_bucket" "buckets" {
  bucket = var.bucket_name
  versioning {
    enabled = false
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}