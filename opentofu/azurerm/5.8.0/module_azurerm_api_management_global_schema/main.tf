resource "azurerm_api_management_global_schema" "api_management_global_schemas" {
  for_each = var.api_management_global_schemas

  api_management_name = each.value.api_management_name
  resource_group_name = each.value.resource_group_name
  schema_id           = each.value.schema_id
  type                = each.value.type
  value               = each.value.value
  description         = each.value.description
}
