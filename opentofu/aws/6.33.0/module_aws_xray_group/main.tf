resource "aws_xray_group" "xray_groups" {
  for_each = var.xray_groups

  filter_expression = each.value.filter_expression
  group_name        = each.value.group_name
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all

  dynamic "insights_configuration" {
    for_each = each.value.insights_configuration != null ? each.value.insights_configuration : []
    content {
      insights_enabled      = insights_configuration.value.insights_enabled
      notifications_enabled = insights_configuration.value.notifications_enabled
    }
  }
}
