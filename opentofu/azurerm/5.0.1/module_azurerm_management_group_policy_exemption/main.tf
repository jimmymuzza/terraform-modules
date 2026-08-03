resource "azurerm_management_group_policy_exemption" "management_group_policy_exemptions" {
  for_each = var.management_group_policy_exemptions

  exemption_category              = each.value.exemption_category
  management_group_id             = each.value.management_group_id
  name                            = each.value.name
  policy_assignment_id            = each.value.policy_assignment_id
  description                     = each.value.description
  display_name                    = each.value.display_name
  expires_on                      = each.value.expires_on
  metadata                        = each.value.metadata
  policy_definition_reference_ids = each.value.policy_definition_reference_ids
}
