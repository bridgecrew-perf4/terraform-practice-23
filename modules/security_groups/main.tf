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
