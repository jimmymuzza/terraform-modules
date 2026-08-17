resource "aws_efs_backup_policy" "efs_backup_policies" {
  for_each = var.efs_backup_policies

  file_system_id = each.value.file_system_id
  region         = each.value.region

  dynamic "backup_policy" {
    for_each = each.value.backup_policy != null ? each.value.backup_policy : []
    content {
      status = backup_policy.value.status
    }
  }
}
