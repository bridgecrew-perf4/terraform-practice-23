variable "bucket_name" {
    default = "dev-rhassan-testing"
}
variable "region" {
    default = "us-west-2"
}

variable "bucket_name_built_in" {
  type = map
  default = {
    dev = "dev-new-rhassan-test"
    st =  "st-new-rhassan-test"
  }
}