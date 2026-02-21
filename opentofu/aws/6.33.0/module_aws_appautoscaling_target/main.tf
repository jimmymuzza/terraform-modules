resource "aws_appautoscaling_target" "appautoscaling_targets" {
  for_each = var.appautoscaling_targets

  max_capacity       = each.value.max_capacity
  min_capacity       = each.value.min_capacity
  resource_id        = each.value.resource_id
  scalable_dimension = each.value.scalable_dimension
  service_namespace  = each.value.service_namespace
  region             = each.value.region
  role_arn           = each.value.role_arn
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "suspended_state" {
    for_each = each.value.suspended_state != null ? each.value.suspended_state : []
    content {
      dynamic_scaling_in_suspended  = suspended_state.value.dynamic_scaling_in_suspended
      dynamic_scaling_out_suspended = suspended_state.value.dynamic_scaling_out_suspended
      scheduled_scaling_suspended   = suspended_state.value.scheduled_scaling_suspended
    }
  }
}
