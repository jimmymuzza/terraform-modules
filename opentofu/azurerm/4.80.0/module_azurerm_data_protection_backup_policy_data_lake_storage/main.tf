resource "azurerm_data_protection_backup_policy_data_lake_storage" "data_protection_backup_policy_data_lake_storages" {
  for_each = var.data_protection_backup_policy_data_lake_storages

  backup_schedule                 = each.value.backup_schedule
  data_protection_backup_vault_id = each.value.data_protection_backup_vault_id
  default_retention_duration      = each.value.default_retention_duration
  name                            = each.value.name
  time_zone                       = each.value.time_zone

  dynamic "retention_rule" {
    for_each = each.value.retention_rule != null ? each.value.retention_rule : []
    content {
      duration               = retention_rule.value.duration
      name                   = retention_rule.value.name
      absolute_criteria      = retention_rule.value.absolute_criteria
      days_of_week           = retention_rule.value.days_of_week
      months_of_year         = retention_rule.value.months_of_year
      scheduled_backup_times = retention_rule.value.scheduled_backup_times
      weeks_of_month         = retention_rule.value.weeks_of_month
    }
  }
}
