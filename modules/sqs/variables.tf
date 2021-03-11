

variable "sqs_name_map" {
  type = map(any)
  default = {
    dev = "dev-rhassan"
    it  = "it-rhassan"
  }
}


variable "sqs_name_list" {
  type    = list(any)
  default = ["rhassan-dev", "rhassan-it", "rhassan-st"]
}


variable "env" {
  default = false
}