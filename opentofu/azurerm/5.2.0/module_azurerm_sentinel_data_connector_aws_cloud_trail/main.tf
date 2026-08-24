resource "azurerm_sentinel_data_connector_aws_cloud_trail" "sentinel_data_connector_aws_cloud_trails" {
  for_each = var.sentinel_data_connector_aws_cloud_trails

  aws_role_arn               = each.value.aws_role_arn
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
}
