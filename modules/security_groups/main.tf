
resource "aws_security_group" "rhassan-security-group" {
  name        = "${var.prefix}-${var.security_group}"
  description = "Allow TLS inbound traffic"
  # vpc_id = "value"
  dynamic "ingress" {
    for_each = var.ingress_port
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
    }
  }
  dynamic "egress" {
    for_each = var.eggress_port
    content {
      from_port = egress.value
      to_port   = egress.value
      protocol  = "tcp"
    }
  }
}

resource "aws_vpc" "rizbi" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "rizbi" {
  vpc_id     = aws_vpc.rizbi.id
  cidr_block = "10.0.0.0/18"

  tags = {
    Name = "Rizbi"
  }
}