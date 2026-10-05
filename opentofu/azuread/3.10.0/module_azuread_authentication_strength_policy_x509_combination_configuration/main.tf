resource "azuread_authentication_strength_policy_x509_combination_configuration" "authentication_strength_policy_x509_combination_configurations" {
  for_each = var.authentication_strength_policy_x509_combination_configurations

  applies_to_combinations           = each.value.applies_to_combinations
  authentication_strength_policy_id = each.value.authentication_strength_policy_id
  allowed_issuer_skis               = each.value.allowed_issuer_skis
  allowed_policy_oids               = each.value.allowed_policy_oids
}
