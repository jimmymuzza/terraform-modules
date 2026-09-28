resource "azurerm_netapp_account_encryption" "netapp_account_encryptions" {
  for_each = var.netapp_account_encryptions

  encryption_key                        = each.value.encryption_key
  netapp_account_id                     = each.value.netapp_account_id
  cross_tenant_key_vault_resource_id    = each.value.cross_tenant_key_vault_resource_id
  federated_client_id                   = each.value.federated_client_id
  system_assigned_identity_principal_id = each.value.system_assigned_identity_principal_id
  user_assigned_identity_id             = each.value.user_assigned_identity_id
}
