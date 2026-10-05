resource "azurerm_data_protection_backup_policy_blob_storage" "data_protection_backup_policy_blob_storages" {
  for_each = var.data_protection_backup_policy_blob_storages

  name                                   = each.value.name
  vault_id                               = each.value.vault_id
  backup_repeating_time_intervals        = each.value.backup_repeating_time_intervals
  operational_default_retention_duration = each.value.operational_default_retention_duration
  time_zone                              = each.value.time_zone
  vault_default_retention_duration       = each.value.vault_default_retention_duration

  dynamic "retention_rule" {
    for_each = each.value.retention_rule != null ? each.value.retention_rule : []
    content {
      name     = retention_rule.value.name
      priority = retention_rule.value.priority

      dynamic "criteria" {
        for_each = retention_rule.value.criteria != null ? retention_rule.value.criteria : []
        content {
          absolute_criteria      = criteria.value.absolute_criteria
          days_of_month          = criteria.value.days_of_month
          days_of_week           = criteria.value.days_of_week
          months_of_year         = criteria.value.months_of_year
          scheduled_backup_times = criteria.value.scheduled_backup_times
          weeks_of_month         = criteria.value.weeks_of_month
        }
      }

      dynamic "life_cycle" {
        for_each = retention_rule.value.life_cycle != null ? retention_rule.value.life_cycle : []
        content {
          data_store_type = life_cycle.value.data_store_type
          duration        = life_cycle.value.duration
        }
      }
    }
  }
}
