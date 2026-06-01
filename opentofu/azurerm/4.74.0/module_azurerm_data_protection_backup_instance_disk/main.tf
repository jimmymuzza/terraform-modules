resource "azurerm_data_protection_backup_instance_disk" "data_protection_backup_instance_disks" {
  for_each = var.data_protection_backup_instance_disks

  backup_policy_id             = each.value.backup_policy_id
  disk_id                      = each.value.disk_id
  location                     = each.value.location
  name                         = each.value.name
  snapshot_resource_group_name = each.value.snapshot_resource_group_name
  vault_id                     = each.value.vault_id
  snapshot_subscription_id     = each.value.snapshot_subscription_id
}
