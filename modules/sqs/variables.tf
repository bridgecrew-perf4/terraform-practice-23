

variable "sqs_name_map" {
  type = map
  default = {
    dev = "dev-rhassan"
    it = "it-rhassan"
    }
  }


variable "sqs_name_list" {
  type = list
  default = ["rhassan-dev", "rhassan-it", "rhassan-st"]
  }
