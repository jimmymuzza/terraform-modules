resource "aws_apprunner_observability_configuration" "apprunner_observability_configurations" {
  for_each = var.apprunner_observability_configurations

  observability_configuration_name = each.value.observability_configuration_name
  region                           = each.value.region
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all

  dynamic "trace_configuration" {
    for_each = each.value.trace_configuration != null ? each.value.trace_configuration : []
    content {
      vendor = trace_configuration.value.vendor
    }
  }
}
