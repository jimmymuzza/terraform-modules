resource "azurerm_site_recovery_vmware_replication_policy_association" "site_recovery_vmware_replication_policy_associations" {
  for_each = var.site_recovery_vmware_replication_policy_associations

  name              = each.value.name
  policy_id         = each.value.policy_id
  recovery_vault_id = each.value.recovery_vault_id
}
