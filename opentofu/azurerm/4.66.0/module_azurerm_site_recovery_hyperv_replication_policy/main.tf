resource "azurerm_site_recovery_hyperv_replication_policy" "site_recovery_hyperv_replication_policies" {
  for_each = var.site_recovery_hyperv_replication_policies

  application_consistent_snapshot_frequency_in_hours = each.value.application_consistent_snapshot_frequency_in_hours
  name                                               = each.value.name
  recovery_point_retention_in_hours                  = each.value.recovery_point_retention_in_hours
  recovery_vault_id                                  = each.value.recovery_vault_id
  replication_interval_in_seconds                    = each.value.replication_interval_in_seconds
}
