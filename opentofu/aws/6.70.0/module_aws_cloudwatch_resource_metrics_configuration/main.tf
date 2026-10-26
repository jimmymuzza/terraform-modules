resource "aws_cloudwatch_resource_metrics_configuration" "cloudwatch_resource_metrics_configurations" {
  for_each = var.cloudwatch_resource_metrics_configurations

  resource_arn = each.value.resource_arn
  region       = each.value.region

  dynamic "metric_selection" {
    for_each = each.value.metric_selection != null ? each.value.metric_selection : []
    content {
      include_metrics = metric_selection.value.include_metrics
    }
  }
}
