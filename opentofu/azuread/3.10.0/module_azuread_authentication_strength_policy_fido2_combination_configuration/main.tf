resource "azuread_authentication_strength_policy_fido2_combination_configuration" "authentication_strength_policy_fido2_combination_configurations" {
  for_each = var.authentication_strength_policy_fido2_combination_configurations

  allowed_aaguids                   = each.value.allowed_aaguids
  authentication_strength_policy_id = each.value.authentication_strength_policy_id
}
