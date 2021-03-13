terraform {
  backend "s3" {
      # bucket is assumed to be already deployed. orelse it will not find the bucket
    bucket = "dev-rhassan-testing"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}