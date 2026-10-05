resource "aws_prometheus_workspace" "prometheus_workspaces" {
  for_each = var.prometheus_workspaces

  alias       = each.value.alias
  kms_key_arn = each.value.kms_key_arn
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "logging_configuration" {
    for_each = each.value.logging_configuration != null ? each.value.logging_configuration : []
    content {
      log_group_arn = logging_configuration.value.log_group_arn
    }
  }
}
