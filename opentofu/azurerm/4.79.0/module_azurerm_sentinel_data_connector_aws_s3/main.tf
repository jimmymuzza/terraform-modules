resource "azurerm_sentinel_data_connector_aws_s3" "sentinel_data_connector_aws_s3s" {
  for_each = var.sentinel_data_connector_aws_s3s

  aws_role_arn               = each.value.aws_role_arn
  destination_table          = each.value.destination_table
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  sqs_urls                   = each.value.sqs_urls
}
