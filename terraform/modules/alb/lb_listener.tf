resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.example.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.tg_arn
  }

  lifecycle {
    ignore_changes = [
      default_action.0.target_group_arn
    ]
  }
}
