
################################################################
## RECORDING ENDPOINT OF DB SERVER1
##############################################################
data "aws_db_instance" "db_instance" {
  db_instance_identifier = aws_db_instance.db-server-1.id
}

resource "aws_key_pair" "three-tier" {
  key_name   = var.ec2-key-name
  public_key = file("three-tier.pub")
}

resource "aws_security_group" "php-server-sg" {
  name        = "php-server-sg"
  description = "php-server-sg"
  vpc_id      = aws_vpc.multitier-vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [ aws_security_group.alb-sg.id ]
  }

  tags = {
    Name = "php-server-sg"
  }
  
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_php_10_0_1_0" {
  security_group_id = aws_security_group.php-server-sg.id
  cidr_ipv4         = var.public-web-subnet-1-cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_php_10_0_2_0" {
  security_group_id = aws_security_group.php-server-sg.id
  cidr_ipv4         = var.public-web-subnet-2-cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_php_10_0_3_0" {
  security_group_id = aws_security_group.php-server-sg.id
  cidr_ipv4         = var.public-web-subnet-3-cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_php_10_0_1_0" {
  security_group_id = aws_security_group.php-server-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}



resource "aws_vpc_security_group_egress_rule" "allow_all_out_traffic_php" {
  security_group_id = aws_security_group.php-server-sg.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_instance" "php-server-1" {
  ami               = var.ec2-instance-ami
  instance_type     = var.ec2-instance-type
  key_name          = var.ec2-key-name
  vpc_security_group_ids = [aws_security_group.php-server-sg.id]
  subnet_id         = aws_subnet.private-app-subnet-1.id
  availability_zone = var.zone-1
  associate_public_ip_address = false

  tags = {
    Name = "php-server-1"
  }

  provisioner "file" {
    source      = "lampstack1.sh"
    destination = "/tmp/lampstack1.sh"
    on_failure  = continue
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.private_ip
      private_key = file("three-tier")
      bastion_host = aws_instance.jump-server-1.public_ip
      bastion_user = "ec2-user"
      bastion_private_key = file("three-tier")
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/lampstack1.sh",
      "sudo /tmp/lampstack1.sh",
      "db_endpoint=${data.aws_db_instance.db_instance.endpoint}",
      "sudo sed -i 's/localhost/'\"$db_endpoint\"'/g' /var/www/html/phpMyAdmin/config.sample.inc.php",
      # "sudo mv /var/www/html/config.sample.inc.php /var/www/html/config.inc.php "
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.private_ip
      private_key = file("three-tier")
      bastion_host = aws_instance.jump-server-1.public_ip
      bastion_user = "ec2-user"
      bastion_private_key = file("three-tier")
    }
  }


}


# resource "aws_instance" "php-server-2" {
#   ami               = var.ec2-instance-ami
#   instance_type     = var.ec2-instance-type
#   key_name          = var.ec2-key-name
#   vpc_security_group_ids = [aws_security_group.php-server-sg.id]
#   subnet_id         = aws_subnet.private-app-subnet-2.id
#   availability_zone = var.zone-2
#     associate_public_ip_address = false

#   tags = {
#     Name = "php-server-2"
#   }

#   provisioner "file" {
#     source      = "lampstack2.sh"
#     destination = "/tmp/lampstack2.sh"
#     on_failure  = continue
#     connection {
#       type        = "ssh"
#       user        = "ec2-user"
#       host        = self.private_ip
#       private_key = file("three-tier")
#       bastion_host = aws_instance.jump-server-2.public_ip
#       bastion_user = "ec2-user"
#       bastion_private_key = file("three-tier")
#     }
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "chmod u+x /tmp/lampstack2.sh",
#       "sudo /tmp/lampstack2.sh"
#     ]
#     connection {
#       type        = "ssh"
#       user        = "ec2-user"
#       host        = self.private_ip
#       private_key = file("three-tier")
#       bastion_host = aws_instance.jump-server-2.public_ip
#       bastion_user = "ec2-user"
#       bastion_private_key = file("three-tier")
#     }
#   }
    
# }


# resource "aws_instance" "php-server-3" {
#   ami               = var.ec2-instance-ami
#   instance_type     = var.ec2-instance-type
#   key_name          = var.ec2-key-name
#   vpc_security_group_ids = [aws_security_group.php-server-sg.id]
#   subnet_id         = aws_subnet.private-app-subnet-3.id
#   availability_zone = var.zone-3
#   associate_public_ip_address = false

#   tags = {
#     Name = "php-server-3"
#   }

#   provisioner "file" {
#     source      = "lampstack3.sh"
#     destination = "/tmp/lampstack3.sh"
#     on_failure  = continue
#     connection {
#       type        = "ssh"
#       user        = "ec2-user"
#       host        = self.private_ip
#       private_key = file("three-tier")
#       bastion_host = aws_instance.jump-server-3.public_ip
#       bastion_user = "ec2-user"
#       bastion_private_key = file("three-tier")
#     }
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "chmod u+x /tmp/lampstack3.sh",
#       "sudo /tmp/lampstack3.sh"
#     ]
#     connection {
#       type        = "ssh"
#       user        = "ec2-user"
#       host        = self.private_ip
#       private_key = file("three-tier")
#       bastion_host = aws_instance.jump-server-3.public_ip
#       bastion_user = "ec2-user"
#       bastion_private_key = file("three-tier")
#     }
#   }


# }
