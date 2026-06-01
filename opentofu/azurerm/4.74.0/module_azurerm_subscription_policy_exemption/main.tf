resource "azurerm_subscription_policy_exemption" "subscription_policy_exemptions" {
  for_each = var.subscription_policy_exemptions

  exemption_category              = each.value.exemption_category
  name                            = each.value.name
  policy_assignment_id            = each.value.policy_assignment_id
  subscription_id                 = each.value.subscription_id
  description                     = each.value.description
  display_name                    = each.value.display_name
  expires_on                      = each.value.expires_on
  metadata                        = each.value.metadata
  policy_definition_reference_ids = each.value.policy_definition_reference_ids
}
