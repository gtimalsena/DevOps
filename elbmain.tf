
resource "aws_lb" "devopsdemo2" {
  name               = "devopsdemo2-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_vpc.id]
  subnets            = [aws_subnet.devopsdemo1_subnet.id , aws_subnet.devopsdemo2_subnet.id ]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.devops_demo_bucket.bucket
    prefix  = "devopsdemo2_test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}