resource "aws_lb_target_group" "devops2tg" {
health_check {
  interval = 10
  path = "/"
  protocol = "HTTP"
  timeout = 5
  healthy_threshold = 6
  unhealthy_threshold = 3
}

  name     = "devops2tg"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = aws_vpc.my_first_vpc.id
}
