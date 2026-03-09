resource "azurerm_role_assignment" "role_assignments" {
  for_each = var.role_assignments

  principal_id                           = each.value.principal_id
  scope                                  = each.value.scope
  condition                              = each.value.condition
  condition_version                      = each.value.condition_version
  delegated_managed_identity_resource_id = each.value.delegated_managed_identity_resource_id
  description                            = each.value.description
  name                                   = each.value.name
  principal_type                         = each.value.principal_type
  role_definition_id                     = each.value.role_definition_id
  role_definition_name                   = each.value.role_definition_name
  skip_service_principal_aad_check       = each.value.skip_service_principal_aad_check
}
