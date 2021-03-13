resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "12.5"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.postgres12"
  skip_final_snapshot  = true
  identifier = "rhassan-db"
}

# resource "aws_secretsmanager_secret" "db_secret" {
#   name = var.db_secret_name

# }

# resource "aws_secretsmanager_secret_version" "db_secret_id" {
#   secret_id     = aws_secretsmanager_secret.db_secret.id
#   secret_string = "passriz"   #this is the secret value that is hidden in console
# }