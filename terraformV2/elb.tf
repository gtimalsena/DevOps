resource "aws_elb" "devops_elb" {
  name               = "devops-elb-${terraform.workspace}"
  subnets = aws_subnet.private-subnet.*.id
  security_groups = [aws_security_group.elb_sg.id]
#   access_logs {
#     bucket        = "foo"
#     bucket_prefix = "bar"
#     interval      = 60
#   }

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = aws_instance.web.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "VPC-Web-elb-${terraform.workspace}"
  }
}
