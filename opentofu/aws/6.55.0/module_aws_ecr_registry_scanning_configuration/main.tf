resource "aws_ecr_registry_scanning_configuration" "ecr_registry_scanning_configurations" {
  for_each = var.ecr_registry_scanning_configurations

  scan_type = each.value.scan_type
  region    = each.value.region

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      scan_frequency = rule.value.scan_frequency

      dynamic "repository_filter" {
        for_each = rule.value.repository_filter != null ? rule.value.repository_filter : []
        content {
          filter      = repository_filter.value.filter
          filter_type = repository_filter.value.filter_type
        }
      }
    }
  }
}
