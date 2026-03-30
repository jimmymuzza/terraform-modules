resource "aws_cloudwatch_log_metric_filter" "cloudwatch_log_metric_filters" {
  for_each = var.cloudwatch_log_metric_filters

  log_group_name            = each.value.log_group_name
  name                      = each.value.name
  pattern                   = each.value.pattern
  apply_on_transformed_logs = each.value.apply_on_transformed_logs
  region                    = each.value.region

  dynamic "metric_transformation" {
    for_each = each.value.metric_transformation != null ? each.value.metric_transformation : []
    content {
      name          = metric_transformation.value.name
      namespace     = metric_transformation.value.namespace
      value         = metric_transformation.value.value
      default_value = metric_transformation.value.default_value
      dimensions    = metric_transformation.value.dimensions
      unit          = metric_transformation.value.unit
    }
  }
}
