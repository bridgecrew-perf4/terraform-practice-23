locals {
  common_tags = {
      Name = "Rizbi"
      roll = 1009003
  }
}
resource "aws_s3_bucket" "buckets" {
  bucket = var.bucket_name
  versioning {
    enabled = false
  }

  tags = {
    Name        = "My buckets"
    Environment = "Dev"
  }
}

# ---------------------testing built-in functions------------------------------

resource "aws_s3_bucket" "rhassan_test_new" {
   #https://www.terraform.io/docs/language/functions/lookup.html
  bucket = lookup(var.bucket_name_built_in, "st", "dev")
  tags = local.common_tags
  provisioner "local-exec" {
    when = destroy
    # command = "echo ${aws_s3_bucket.rhassan_test_new.id} >> s3.txt"     # use this in case of creation-time provisioner
    command = "echo ${self.id} >> s3.txt"   # use this in case of destroy-time provisioner

  }

}