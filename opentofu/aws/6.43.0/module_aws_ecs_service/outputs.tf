output "ecs_services" {
  description = "All ecs_service resources"
  value       = aws_ecs_service.ecs_services
}
