resource "aws_ecs_cluster" "example" {
  name               = "example-cluster"
  capacity_providers = []
  tags = {
    "Name" = "example-cluster"
  }

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
