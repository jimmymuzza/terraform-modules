resource "azurerm_api_management_workspace_policy_fragment" "api_management_workspace_policy_fragments" {
  for_each = var.api_management_workspace_policy_fragments

  api_management_workspace_id = each.value.api_management_workspace_id
  name                        = each.value.name
  xml_content                 = each.value.xml_content
  description                 = each.value.description
  xml_format                  = each.value.xml_format
}
