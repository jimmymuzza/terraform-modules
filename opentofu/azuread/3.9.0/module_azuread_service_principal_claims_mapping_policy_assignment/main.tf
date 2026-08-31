resource "azuread_service_principal_claims_mapping_policy_assignment" "service_principal_claims_mapping_policy_assignments" {
  for_each = var.service_principal_claims_mapping_policy_assignments

  claims_mapping_policy_id = each.value.claims_mapping_policy_id
  service_principal_id     = each.value.service_principal_id
}
