resource "azuread_claims_mapping_policy" "claims_mapping_policies" {
  for_each = var.claims_mapping_policies

  definition   = each.value.definition
  display_name = each.value.display_name
}
