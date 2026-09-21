output "ecs_daemon_task_definitions" {
  description = "All ecs_daemon_task_definition resources"
  value       = aws_ecs_daemon_task_definition.ecs_daemon_task_definitions
}
