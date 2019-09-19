resource "aws_lb_target_group" "tg_one" {
  name     = "javahome-tg-one"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.javahome.id}"
}

resource "aws_lb_target_group" "tg_two" {
  name     = "javahome-tg-two"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.javahome.id}"
}


resource "aws_lb" "javahome" {
  name               = "javahome-alb"
  internal           = false
  load_balancer_type = "application"
  
  subnets            = ["${aws_subnet.public.id}"]

  enable_deletion_protection = false


  tags = {
    Environment = "dev"
  }
}
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.javahome.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg_one.arn}"
  }
}

resource "aws_lb_listener_rule" "orders" {
  listener_arn = "${aws_lb_listener.front_end.arn}"
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg_two.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/orders/*"]
  }
}