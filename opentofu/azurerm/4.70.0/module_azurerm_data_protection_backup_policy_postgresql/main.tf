resource "azurerm_data_protection_backup_policy_postgresql" "data_protection_backup_policy_postgresqls" {
  for_each = var.data_protection_backup_policy_postgresqls

  backup_repeating_time_intervals = each.value.backup_repeating_time_intervals
  default_retention_duration      = each.value.default_retention_duration
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  vault_name                      = each.value.vault_name
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
          absolute_criteria      = criteria.value.absolute_criteria
          days_of_week           = criteria.value.days_of_week
          months_of_year         = criteria.value.months_of_year
          scheduled_backup_times = criteria.value.scheduled_backup_times
          weeks_of_month         = criteria.value.weeks_of_month
        }
      }
    }
  }
}
