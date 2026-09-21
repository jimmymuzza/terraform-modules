resource "azurerm_api_management_workspace_policy" "api_management_workspace_policies" {
  for_each = var.api_management_workspace_policies

  api_management_workspace_id = each.value.api_management_workspace_id
  xml_content                 = each.value.xml_content
  xml_link                    = each.value.xml_link
}
