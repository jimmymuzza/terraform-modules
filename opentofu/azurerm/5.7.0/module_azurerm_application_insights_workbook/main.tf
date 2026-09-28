resource "azurerm_application_insights_workbook" "application_insights_workbooks" {
  for_each = var.application_insights_workbooks

  data_json            = each.value.data_json
  display_name         = each.value.display_name
  location             = each.value.location
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  category             = each.value.category
  description          = each.value.description
  source_id            = each.value.source_id
  storage_container_id = each.value.storage_container_id
  tags                 = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
