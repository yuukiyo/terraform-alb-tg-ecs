resource "aws_iam_role" "example" {
  assume_role_policy = jsonencode({
    "Version" : "2008-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "ecs-tasks.amazonaws.com"
        },
        "Effect" : "Allow"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "example" {
  role       = aws_iam_role.example.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_definition" "example" {
  container_definitions = jsonencode([{
    "command" : [],
    "cpu" : 256,
    "dnsSearchDomains" : [],
    "dnsServers" : [],
    "dockerSecurityOptions" : [],
    "entryPoint" : [],
    "environment" : [],
    "essential" : true,
    "image" : "yuukiyo/ecs-sample-app:v1",
    "links" : [],
    "logConfiguration" : {
      "logDriver" : "awslogs",
      "options" : {
        "awslogs-group" : "${var.app_name}",
        "awslogs-region" : "ap-northeast-1",
        "awslogs-stream-prefix" : "logs"
      }
    },
    "memory" : 512,
    "mountPoints" : [],
    "name" : "${var.app_name}",
    "portMappings" : [
      {
        "containerPort" : 80,
        "hostPort" : 80,
        "protocol" : "tcp"
      }
    ],
    "systemControls" : [],
    "volumesFrom" : []
  }])
  cpu                      = "256"
  execution_role_arn       = aws_iam_role.example.arn
  family                   = var.app_name
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  tags                     = {}
}
