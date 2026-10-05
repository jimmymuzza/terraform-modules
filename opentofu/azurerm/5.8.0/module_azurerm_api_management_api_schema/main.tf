resource "azurerm_api_management_api_schema" "api_management_api_schemas" {
  for_each = var.api_management_api_schemas

  api_management_name = each.value.api_management_name
  api_name            = each.value.api_name
  content_type        = each.value.content_type
  resource_group_name = each.value.resource_group_name
  schema_id           = each.value.schema_id
  components          = each.value.components
  definitions         = each.value.definitions
  value               = each.value.value
}
