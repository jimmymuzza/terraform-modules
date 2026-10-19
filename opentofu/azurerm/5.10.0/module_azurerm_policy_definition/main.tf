resource "azurerm_policy_definition" "policy_definitions" {
  for_each = var.policy_definitions

  display_name        = each.value.display_name
  mode                = each.value.mode
  name                = each.value.name
  policy_type         = each.value.policy_type
  description         = each.value.description
  management_group_id = each.value.management_group_id
  metadata            = each.value.metadata
  parameters          = each.value.parameters
  policy_rule         = each.value.policy_rule
}
