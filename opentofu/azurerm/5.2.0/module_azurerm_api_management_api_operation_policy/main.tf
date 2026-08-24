resource "azurerm_api_management_api_operation_policy" "api_management_api_operation_policies" {
  for_each = var.api_management_api_operation_policies

  api_management_name = each.value.api_management_name
  api_name            = each.value.api_name
  operation_id        = each.value.operation_id
  resource_group_name = each.value.resource_group_name
  xml_content         = each.value.xml_content
  xml_link            = each.value.xml_link
}
