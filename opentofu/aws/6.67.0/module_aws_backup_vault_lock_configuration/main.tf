resource "aws_backup_vault_lock_configuration" "backup_vault_lock_configurations" {
  for_each = var.backup_vault_lock_configurations

  backup_vault_name   = each.value.backup_vault_name
  changeable_for_days = each.value.changeable_for_days
  max_retention_days  = each.value.max_retention_days
  min_retention_days  = each.value.min_retention_days
  region              = each.value.region
}
