resource "aws_prometheus_query_logging_configuration" "prometheus_query_logging_configurations" {
  for_each = var.prometheus_query_logging_configurations

  workspace_id = each.value.workspace_id
  region       = each.value.region

  dynamic "destination" {
    for_each = each.value.destination != null ? each.value.destination : []
    content {

      dynamic "cloudwatch_logs" {
        for_each = destination.value.cloudwatch_logs != null ? destination.value.cloudwatch_logs : []
        content {
          log_group_arn = cloudwatch_logs.value.log_group_arn
        }
      }

      dynamic "filters" {
        for_each = destination.value.filters != null ? destination.value.filters : []
        content {
          qsp_threshold = filters.value.qsp_threshold
        }
      }
    }
  }
}
