resource "azurerm_oracle_autonomous_database_backup" "oracle_autonomous_database_backups" {
  for_each = var.oracle_autonomous_database_backups

  autonomous_database_id   = each.value.autonomous_database_id
  name                     = each.value.name
  retention_period_in_days = each.value.retention_period_in_days
  type                     = each.value.type
}
