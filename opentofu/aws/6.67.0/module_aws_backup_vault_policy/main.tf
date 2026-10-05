resource "aws_backup_vault_policy" "backup_vault_policies" {
  for_each = var.backup_vault_policies

  backup_vault_name = each.value.backup_vault_name
  policy            = each.value.policy
  region            = each.value.region
}
