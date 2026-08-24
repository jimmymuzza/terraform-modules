resource "aws_backup_vault" "backup_vaults" {
  for_each = var.backup_vaults

  name          = each.value.name
  force_destroy = each.value.force_destroy
  kms_key_arn   = each.value.kms_key_arn
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all
}
