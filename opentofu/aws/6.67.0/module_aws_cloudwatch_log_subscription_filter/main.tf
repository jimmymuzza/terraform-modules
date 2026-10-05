resource "aws_cloudwatch_log_subscription_filter" "cloudwatch_log_subscription_filters" {
  for_each = var.cloudwatch_log_subscription_filters

  destination_arn           = each.value.destination_arn
  filter_pattern            = each.value.filter_pattern
  log_group_name            = each.value.log_group_name
  name                      = each.value.name
  apply_on_transformed_logs = each.value.apply_on_transformed_logs
  distribution              = each.value.distribution
  emit_system_fields        = each.value.emit_system_fields
  region                    = each.value.region
  role_arn                  = each.value.role_arn
}
