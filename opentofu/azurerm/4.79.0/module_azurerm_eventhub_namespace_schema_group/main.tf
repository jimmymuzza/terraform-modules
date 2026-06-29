resource "azurerm_eventhub_namespace_schema_group" "eventhub_namespace_schema_groups" {
  for_each = var.eventhub_namespace_schema_groups

  name                 = each.value.name
  namespace_id         = each.value.namespace_id
  schema_compatibility = each.value.schema_compatibility
  schema_type          = each.value.schema_type
}
