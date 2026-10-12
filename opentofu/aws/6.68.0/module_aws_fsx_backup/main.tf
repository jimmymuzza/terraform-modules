resource "aws_fsx_backup" "fsx_backups" {
  for_each = var.fsx_backups

  file_system_id = each.value.file_system_id
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all
  volume_id      = each.value.volume_id
}
