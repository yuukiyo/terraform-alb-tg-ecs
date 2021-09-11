resource "aws_lb" "example" {
  name                       = "example-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.example-alb.id]
  enable_deletion_protection = false
  idle_timeout               = 30
  subnets                    = var.alb_subnets
  tags = {
    Name = "example-alb"
  }
}
