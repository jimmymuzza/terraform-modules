resource "azurerm_monitor_scheduled_query_rules_log" "monitor_scheduled_query_rules_logs" {
  for_each = var.monitor_scheduled_query_rules_logs

  data_source_id          = each.value.data_source_id
  location                = each.value.location
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  authorized_resource_ids = each.value.authorized_resource_ids
  description             = each.value.description
  enabled                 = each.value.enabled
  tags                    = each.value.tags

  dynamic "criteria" {
    for_each = each.value.criteria != null ? each.value.criteria : []
    content {
      metric_name = criteria.value.metric_name

      dynamic "dimension" {
        for_each = criteria.value.dimension != null ? criteria.value.dimension : []
        content {
          name     = dimension.value.name
          values   = dimension.value.values
          operator = dimension.value.operator
        }
      }
    }
  }
}
