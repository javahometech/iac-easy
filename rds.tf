resource "aws_db_subnet_group" "javahome" {
  name       = "rds_subnets_javahome"
  subnet_ids = ["${aws_subnet.private1.id}", "${aws_subnet.private2.id}"]

  tags = {
    Name = "JavaHome RDS subnet group"
  }
}

data "aws_secretsmanager_secret_version" "example" {
  secret_id = "dev/javahome/app"
}

data "aws_secretsmanager_secret_version" "by-version-stage" {
  secret_id     = "dev/javahome/app"
}
resource "aws_db_instance" "javahome_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "javahome"
  username             = "javahome"
  password             = "${jsondecode(data.aws_secretsmanager_secret_version.example.secret_string)["rds_db_password"]}"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.javahome.name}"
  backup_window = "03:46-04:16"
}
