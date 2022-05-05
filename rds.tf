# RDS-Related-Config-Issues
# pingsafe is awesome

#######################################################
# VPC & Subnet
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_security_group" "default" {
  vpc_id = "${data.aws_vpc.default.id}"
  name   = "default"
}

#######################################################

# MarioDB RDS instance 
resource "aws_db_instance" "iac-apsouth1-rds-mariodb" {
  allocated_storage               = 10
  engine                          = "mariadb"
  engine_version                  = "10.2.21"
  instance_class                  = "db.t2.micro"
  identifier                      = "iac-apsouth1-rds-mariodb" 
  db_name                         = "mariodb"
  password                        = "password"
  username                        = "admin"
  final_snapshot_identifier       = "iac-apsouth1-rds-mariodb-snapshot"
  skip_final_snapshot             = "true"
  multi_az                        = false
  port                            = 3306
  storage_encrypted               = false
  publicly_accessible             = false
  deletion_protection             = false
  tags = {
      Name        = "iac-apsouth1-rds-mariodb"
    }
}















