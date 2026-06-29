resource "aws_autoscaling_lifecycle_hook" "autoscaling_lifecycle_hooks" {
  for_each = var.autoscaling_lifecycle_hooks

  autoscaling_group_name  = each.value.autoscaling_group_name
  lifecycle_transition    = each.value.lifecycle_transition
  name                    = each.value.name
  default_result          = each.value.default_result
  heartbeat_timeout       = each.value.heartbeat_timeout
  notification_metadata   = each.value.notification_metadata
  notification_target_arn = each.value.notification_target_arn
  region                  = each.value.region
  role_arn                = each.value.role_arn
}
