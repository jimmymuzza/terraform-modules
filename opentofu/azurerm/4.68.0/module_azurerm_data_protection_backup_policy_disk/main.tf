resource "azurerm_data_protection_backup_policy_disk" "data_protection_backup_policy_disks" {
  for_each = var.data_protection_backup_policy_disks

  backup_repeating_time_intervals = each.value.backup_repeating_time_intervals
  default_retention_duration      = each.value.default_retention_duration
  name                            = each.value.name
  vault_id                        = each.value.vault_id
  time_zone                       = each.value.time_zone

  dynamic "retention_rule" {
    for_each = each.value.retention_rule != null ? each.value.retention_rule : []
    content {
      duration = retention_rule.value.duration
      name     = retention_rule.value.name
      priority = retention_rule.value.priority

      dynamic "criteria" {
        for_each = retention_rule.value.criteria != null ? retention_rule.value.criteria : []
        content {
          absolute_criteria = criteria.value.absolute_criteria
        }
      }
    }
  }
}
