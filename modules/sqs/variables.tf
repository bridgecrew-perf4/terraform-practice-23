

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

variable "retention_time" {
  type = number
  default = 345600
}

variable "delay_seconds" {
  type = number
  default = 0
}

variable "sqs_name" {
  type = map
  default = {
    default = "default_sqs"
    dev = "dev_sqs"
  }
}