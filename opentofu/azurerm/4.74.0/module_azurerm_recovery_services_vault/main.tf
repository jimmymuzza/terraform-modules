resource "azurerm_recovery_services_vault" "recovery_services_vaults" {
  for_each = var.recovery_services_vaults

  location                           = each.value.location
  name                               = each.value.name
  resource_group_name                = each.value.resource_group_name
  sku                                = each.value.sku
  classic_vmware_replication_enabled = each.value.classic_vmware_replication_enabled
  cross_region_restore_enabled       = each.value.cross_region_restore_enabled
  immutability                       = each.value.immutability
  public_network_access_enabled      = each.value.public_network_access_enabled
  soft_delete_enabled                = each.value.soft_delete_enabled
  storage_mode_type                  = each.value.storage_mode_type
  tags                               = each.value.tags

  dynamic "encryption" {
    for_each = each.value.encryption != null ? each.value.encryption : []
    content {
      infrastructure_encryption_enabled = encryption.value.infrastructure_encryption_enabled
      key_id                            = encryption.value.key_id
      use_system_assigned_identity      = encryption.value.use_system_assigned_identity
      user_assigned_identity_id         = encryption.value.user_assigned_identity_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "monitoring" {
    for_each = each.value.monitoring != null ? each.value.monitoring : []
    content {
      alerts_for_all_job_failures_enabled            = monitoring.value.alerts_for_all_job_failures_enabled
      alerts_for_critical_operation_failures_enabled = monitoring.value.alerts_for_critical_operation_failures_enabled
    }
  }
}
