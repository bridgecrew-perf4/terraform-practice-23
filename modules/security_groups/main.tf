resource "aws_security_group" "rhassan-security-group" {
    name = "${var.prefix}-${var.security_group}"
    description = "Allow TLS inbound traffic"
    # vpc_id = "value"
    ingress {
        description = "TLS from VPC"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        # cidr_blocks = [aws_vpc.main.cidr_block]
  }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "rizbi" {
  cidr_block       = "10.0.0.0/16"
}

resource "aws_subnet" "rizbi" {
  vpc_id     = aws_vpc.rizbi.id
  cidr_block = "10.0.0.0/18"

  tags = {
    Name = "Rizbi"
  }
}