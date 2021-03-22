
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

# resource "aws_instance" "rizbi_east_1" {
#   instance_type = "t3.micro"
#   provider = aws.east
#   ami           = "ami-038f1ca1bd58a5790"
# #   tags          = local.common_tags
# }