resource "azurerm_site_recovery_hyperv_replication_policy_association" "site_recovery_hyperv_replication_policy_associations" {
  for_each = var.site_recovery_hyperv_replication_policy_associations

  hyperv_site_id = each.value.hyperv_site_id
  name           = each.value.name
  policy_id      = each.value.policy_id
}
