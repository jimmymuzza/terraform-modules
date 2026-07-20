resource "azuread_authentication_strength_policy" "authentication_strength_policies" {
  for_each = var.authentication_strength_policies

  allowed_combinations = each.value.allowed_combinations
  display_name         = each.value.display_name
  description          = each.value.description
}
