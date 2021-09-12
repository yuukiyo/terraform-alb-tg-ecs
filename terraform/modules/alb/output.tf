output "lb" {
  value = aws_lb.example
}

output "lb_sg" {
  value = aws_security_group.example-alb
}
