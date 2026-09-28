resource "aws_appautoscaling_scheduled_action" "appautoscaling_scheduled_actions" {
  for_each = var.appautoscaling_scheduled_actions

  name               = each.value.name
  resource_id        = each.value.resource_id
  scalable_dimension = each.value.scalable_dimension
  schedule           = each.value.schedule
  service_namespace  = each.value.service_namespace
  end_time           = each.value.end_time
  region             = each.value.region
  start_time         = each.value.start_time
  timezone           = each.value.timezone

  dynamic "scalable_target_action" {
    for_each = each.value.scalable_target_action != null ? each.value.scalable_target_action : []
    content {
      max_capacity = scalable_target_action.value.max_capacity
      min_capacity = scalable_target_action.value.min_capacity
    }
  }
}
