resource "aws_applicationinsights_application" "applicationinsights_applications" {
  for_each = var.applicationinsights_applications

  resource_group_name    = each.value.resource_group_name
  auto_config_enabled    = each.value.auto_config_enabled
  auto_create            = each.value.auto_create
  cwe_monitor_enabled    = each.value.cwe_monitor_enabled
  grouping_type          = each.value.grouping_type
  ops_center_enabled     = each.value.ops_center_enabled
  ops_item_sns_topic_arn = each.value.ops_item_sns_topic_arn
  region                 = each.value.region
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
}
