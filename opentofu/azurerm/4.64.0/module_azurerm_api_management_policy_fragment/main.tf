resource "azurerm_api_management_policy_fragment" "api_management_policy_fragments" {
  for_each = var.api_management_policy_fragments

  api_management_id = each.value.api_management_id
  name              = each.value.name
  value             = each.value.value
  description       = each.value.description
  format            = each.value.format
}
