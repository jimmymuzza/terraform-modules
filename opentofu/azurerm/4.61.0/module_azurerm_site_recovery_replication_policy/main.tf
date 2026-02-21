resource "azurerm_site_recovery_replication_policy" "site_recovery_replication_policies" {
  for_each = var.site_recovery_replication_policies

  application_consistent_snapshot_frequency_in_minutes = each.value.application_consistent_snapshot_frequency_in_minutes
  name                                                 = each.value.name
  recovery_point_retention_in_minutes                  = each.value.recovery_point_retention_in_minutes
  recovery_vault_name                                  = each.value.recovery_vault_name
  resource_group_name                                  = each.value.resource_group_name
}
