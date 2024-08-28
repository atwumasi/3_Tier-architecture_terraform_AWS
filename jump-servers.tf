
resource "aws_security_group" "jump-server-sg" {
  name        = "jump-server-sg"
  description = "jump-server-sg"
  vpc_id      = aws_vpc.multitier-vpc.id

  tags = {
    Name = "jump-server-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_js" {
  security_group_id = aws_security_group.jump-server-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_js" {
  security_group_id = aws_security_group.jump-server-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_out_traffic_js" {
  security_group_id = aws_security_group.jump-server-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


resource "aws_instance" "jump-server-1" {
  ami               = var.ec2-instance-ami
  instance_type     = var.ec2-instance-type
  key_name          = var.ec2-key-name
  vpc_security_group_ids = [aws_security_group.jump-server-sg.id]
  subnet_id         = aws_subnet.public-web-subnet-1.id
  availability_zone = var.zone-1
  
  tags = {
    Name = "jump-server-1"
  }
}

resource "aws_instance" "jump-server-2" {
  ami               = var.ec2-instance-ami
  instance_type     = var.ec2-instance-type
  key_name          = var.ec2-key-name
  vpc_security_group_ids = [aws_security_group.jump-server-sg.id]
  subnet_id         = aws_subnet.public-web-subnet-2.id
  availability_zone = var.zone-2
  
  tags = {
    Name = "jump-server-2"
  }
}

resource "aws_instance" "jump-server-3" {
  ami               = var.ec2-instance-ami
  instance_type     = var.ec2-instance-type
  key_name          = "three-tier"
  vpc_security_group_ids = [aws_security_group.jump-server-sg.id]
  subnet_id         = aws_subnet.public-web-subnet-3.id
  availability_zone = var.zone-3
  
  tags = {
    Name = "jump-server-3"
  }
}




