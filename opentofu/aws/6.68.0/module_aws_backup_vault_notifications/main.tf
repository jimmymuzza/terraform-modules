resource "aws_backup_vault_notifications" "backup_vault_notifications" {
  for_each = var.backup_vault_notifications

  backup_vault_events = each.value.backup_vault_events
  backup_vault_name   = each.value.backup_vault_name
  sns_topic_arn       = each.value.sns_topic_arn
  region              = each.value.region
}
