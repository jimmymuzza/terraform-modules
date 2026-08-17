resource "aws_backup_global_settings" "backup_global_settings" {
  for_each = var.backup_global_settings

  global_settings = each.value.global_settings
}
