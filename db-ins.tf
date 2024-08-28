resource "aws_db_instance" "db-server-1" {
  allocated_storage    = 20
  db_name              = "mydb"
  identifier = "db-server-1"
  engine               = var.db-engine
  engine_version       = var.engine-version
  instance_class       = var.db-instance-class
  username             = var.db-username
  password             = var.db-username-pswd
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  availability_zone = var.zone-1
  db_subnet_group_name = aws_db_subnet_group.my-db-subnet-group.id
  vpc_security_group_ids = [ aws_security_group.db-server-sg.id ]


  tags = {
    Name = "db-server-1"
  }
  
}
# ############ DB SERVER 2
# resource "aws_db_instance" "db-server-2" {
#   allocated_storage    = 20
#   db_name              = "mydb"
#   identifier = "db-server-2"
#   engine               = var.db-engine
#   engine_version       = var.engine-version
#   instance_class       = var.db-instance-class
#   username             = var.db-username
#   password             = var.db-username-pswd
#   parameter_group_name = "default.mysql8.0"
#   skip_final_snapshot  = true
#   availability_zone = var.zone-2
#   db_subnet_group_name = aws_db_subnet_group.my-db-subnet-group.id
#   vpc_security_group_ids = [ aws_security_group.db-server-sg.id ]


#   tags = {
#     Name = "db-server-2"
#   }
  
# }

# ############ DB SERVER 3
# resource "aws_db_instance" "db-server-3" {
#   allocated_storage    = 20
#   db_name              = "mydb"
#   identifier = "db-server-3"
#   engine               = var.db-engine
#   engine_version       = var.engine-version
#   instance_class       = var.db-instance-class
#   username             = var.db-username
#   password             = var.db-username-pswd
#   parameter_group_name = "default.mysql8.0"
#   skip_final_snapshot  = true
#   availability_zone = var.zone-3
#   db_subnet_group_name = aws_db_subnet_group.my-db-subnet-group.id
#   vpc_security_group_ids = [ aws_security_group.db-server-sg.id ]


#   tags = {
#     Name = "db-server-3"
#   }
  
# }

#### CREATING DB SUBNET GROUP
resource "aws_db_subnet_group" "my-db-subnet-group" {
  name = "my-db-subnet-group"
  subnet_ids = [
    aws_subnet.private-db-subnet-1.id,
    aws_subnet.private-db-subnet-2.id,
    aws_subnet.private-db-subnet-3.id
  ]

  tags = {
    Name = "multitier-DB-Subnet-Group"
  }
}

######## CREATING DB SERVER SECURITY GROUP
resource "aws_security_group" "db-server-sg" {
  name        = "db-server-sg"
  description = "db-server-sg"
  vpc_id      = aws_vpc.multitier-vpc.id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [ aws_security_group.php-server-sg.id ]
  }

    egress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [ aws_security_group.php-server-sg.id ]
  }


  tags = {
    Name = "db-server-sg"
  }
  
}