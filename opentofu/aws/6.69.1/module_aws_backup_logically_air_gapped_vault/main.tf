resource "aws_backup_logically_air_gapped_vault" "backup_logically_air_gapped_vaults" {
  for_each = var.backup_logically_air_gapped_vaults

  max_retention_days = each.value.max_retention_days
  min_retention_days = each.value.min_retention_days
  name               = each.value.name
  encryption_key_arn = each.value.encryption_key_arn
  region             = each.value.region
  tags               = each.value.tags
}
