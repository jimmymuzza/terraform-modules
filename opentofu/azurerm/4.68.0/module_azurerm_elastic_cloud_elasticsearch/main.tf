resource "azurerm_elastic_cloud_elasticsearch" "elastic_cloud_elasticsearches" {
  for_each = var.elastic_cloud_elasticsearches

  elastic_cloud_email_address = each.value.elastic_cloud_email_address
  location                    = each.value.location
  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  sku_name                    = each.value.sku_name
  monitoring_enabled          = each.value.monitoring_enabled
  tags                        = each.value.tags

  dynamic "logs" {
    for_each = each.value.logs != null ? each.value.logs : []
    content {
      send_activity_logs     = logs.value.send_activity_logs
      send_azuread_logs      = logs.value.send_azuread_logs
      send_subscription_logs = logs.value.send_subscription_logs

      dynamic "filtering_tag" {
        for_each = logs.value.filtering_tag != null ? logs.value.filtering_tag : []
        content {
          action = filtering_tag.value.action
          name   = filtering_tag.value.name
          value  = filtering_tag.value.value
        }
      }
    }
  }
}
