resource "aws_ecs_daemon" "ecs_daemons" {
  for_each = var.ecs_daemons

  capacity_provider_arns     = each.value.capacity_provider_arns
  daemon_task_definition_arn = each.value.daemon_task_definition_arn
  name                       = each.value.name
  cluster_arn                = each.value.cluster_arn
  enable_ecs_managed_tags    = each.value.enable_ecs_managed_tags
  enable_execute_command     = each.value.enable_execute_command
  propagate_tags             = each.value.propagate_tags
  region                     = each.value.region
  tags                       = each.value.tags

  dynamic "deployment_configuration" {
    for_each = each.value.deployment_configuration != null ? each.value.deployment_configuration : []
    content {
      bake_time_in_minutes = deployment_configuration.value.bake_time_in_minutes
      drain_percent        = deployment_configuration.value.drain_percent

      dynamic "alarms" {
        for_each = deployment_configuration.value.alarms != null ? deployment_configuration.value.alarms : []
        content {
          alarm_names = alarms.value.alarm_names
          enable      = alarms.value.enable
        }
      }
    }
  }
}
