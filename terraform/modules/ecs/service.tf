resource "aws_ecs_service" "example" {
  cluster                            = aws_ecs_cluster.example.id
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  enable_ecs_managed_tags            = false
  health_check_grace_period_seconds  = 0
  launch_type                        = "FARGATE"
  name                               = "example-service"
  platform_version                   = "1.4.0"
  scheduling_strategy                = "REPLICA"
  tags                               = {}
  task_definition                    = aws_ecs_task_definition.example.arn

  load_balancer {
    container_name   = var.app_name
    container_port   = 80
    target_group_arn = var.tg_arn
  }

  network_configuration {
    assign_public_ip = true
    security_groups = [
      var.lb_sg_id
    ]
    subnets = var.subnets
  }
}

