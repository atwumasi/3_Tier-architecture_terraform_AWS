resource "aws_security_group" "alb-sg" {
  name        = "alb-sg"
  description = "security_group_for_alb"
  vpc_id      = aws_vpc.multitier-vpc.id

  tags = {
    Name = "alb-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_alb" {
  security_group_id = aws_security_group.alb-sg.id
  cidr_ipv4    = "0.0.0.0/0"
  from_port         = 80
  ip_protocol          = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_out_traffic_alb" {
  security_group_id = aws_security_group.alb-sg.id
  cidr_ipv4    = "0.0.0.0/0"
  ip_protocol          = "-1"
}

resource "aws_lb_target_group" "alb-tg" {
  name        = "alb-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.multitier-vpc.id
}

resource "aws_lb_target_group_attachment" "register-php-server-1" {
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.php-server-1.id
  port             = 80
}

# resource "aws_lb_target_group_attachment" "register-php-server-2" {
#   target_group_arn = aws_lb_target_group.alb-tg.arn
#   target_id        = aws_instance.php-server-2.id
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "register-php-server-3" {
#   target_group_arn = aws_lb_target_group.alb-tg.arn
#   target_id        = aws_instance.php-server-3.id
#   port             = 80
# }

resource "aws_lb" "multitier-alb" {
  name               = "multitier-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [
    aws_subnet.public-web-subnet-1.id,
    aws_subnet.public-web-subnet-2.id,
    aws_subnet.public-web-subnet-3.id
  ]
  enable_deletion_protection = false
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.multitier-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }
}
