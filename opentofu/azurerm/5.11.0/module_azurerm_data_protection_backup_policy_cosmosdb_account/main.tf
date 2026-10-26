resource "azurerm_data_protection_backup_policy_cosmosdb_account" "data_protection_backup_policy_cosmosdb_accounts" {
  for_each = var.data_protection_backup_policy_cosmosdb_accounts

  backup_schedule                 = each.value.backup_schedule
  data_protection_backup_vault_id = each.value.data_protection_backup_vault_id
  default_retention_duration      = each.value.default_retention_duration
  name                            = each.value.name
  backup_frequency                = each.value.backup_frequency

  dynamic "monthly_retention_rule" {
    for_each = each.value.monthly_retention_rule != null ? each.value.monthly_retention_rule : []
    content {
      duration       = monthly_retention_rule.value.duration
      days_of_week   = monthly_retention_rule.value.days_of_week
      weeks_of_month = monthly_retention_rule.value.weeks_of_month
    }
  }

  dynamic "weekly_retention_rule" {
    for_each = each.value.weekly_retention_rule != null ? each.value.weekly_retention_rule : []
    content {
      duration     = weekly_retention_rule.value.duration
      days_of_week = weekly_retention_rule.value.days_of_week
    }
  }

  dynamic "yearly_retention_rule" {
    for_each = each.value.yearly_retention_rule != null ? each.value.yearly_retention_rule : []
    content {
      duration       = yearly_retention_rule.value.duration
      days_of_week   = yearly_retention_rule.value.days_of_week
      months_of_year = yearly_retention_rule.value.months_of_year
      weeks_of_month = yearly_retention_rule.value.weeks_of_month
    }
  }
}
