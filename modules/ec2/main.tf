
locals {
  common_tags = {
    Name = "Rizbi"
    roll = 1009003
  }
}

data "aws_ami" "rizbi" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "rizbi" {
  instance_type = "t3.micro"
  ami           = data.aws_ami.rizbi.id
  tags          = local.common_tags
}