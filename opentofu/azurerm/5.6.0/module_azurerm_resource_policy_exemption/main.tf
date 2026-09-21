resource "azurerm_resource_policy_exemption" "resource_policy_exemptions" {
  for_each = var.resource_policy_exemptions

  exemption_category              = each.value.exemption_category
  name                            = each.value.name
  policy_assignment_id            = each.value.policy_assignment_id
  resource_id                     = each.value.resource_id
  description                     = each.value.description
  display_name                    = each.value.display_name
  expires_on                      = each.value.expires_on
  metadata                        = each.value.metadata
  policy_definition_reference_ids = each.value.policy_definition_reference_ids
}
