
resource "aws_ecs_cluster" "main" {
  name = "drupal-cluster"
}

resource "aws_ecs_service" "drupal_service" {
  name            = "drupal-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.drupal.arn
  desired_count   = 1
  launch_type     = "EC2"
  network_configuration {
    subnets          = [aws_subnet.public.id]
    assign_public_ip = true
  }
}
