resource "azurerm_backup_protected_vm" "backup_protected_vms" {
  for_each = var.backup_protected_vms

  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.resource_group_name
  backup_policy_id    = each.value.backup_policy_id
  exclude_disk_luns   = each.value.exclude_disk_luns
  include_disk_luns   = each.value.include_disk_luns
  protection_state    = each.value.protection_state
  source_vm_id        = each.value.source_vm_id
}
