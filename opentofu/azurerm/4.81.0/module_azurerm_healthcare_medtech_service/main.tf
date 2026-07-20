resource "azurerm_healthcare_medtech_service" "healthcare_medtech_services" {
  for_each = var.healthcare_medtech_services

  device_mapping_json          = each.value.device_mapping_json
  eventhub_consumer_group_name = each.value.eventhub_consumer_group_name
  eventhub_name                = each.value.eventhub_name
  eventhub_namespace_name      = each.value.eventhub_namespace_name
  location                     = each.value.location
  name                         = each.value.name
  workspace_id                 = each.value.workspace_id
  tags                         = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
