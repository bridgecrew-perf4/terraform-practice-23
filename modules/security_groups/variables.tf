variable "security_group" {
  default = "rhassan-security-group"
}
variable "prefix" {
  default = "orca"
}

variable "ingress_port" {
  type    = list(any)
  default = [443, 80, 0]
}

variable "eggress_port" {
  type    = list(any)
  default = [440, 80, 0]
}
