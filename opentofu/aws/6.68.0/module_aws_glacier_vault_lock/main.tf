resource "aws_glacier_vault_lock" "glacier_vault_locks" {
  for_each = var.glacier_vault_locks

  complete_lock         = each.value.complete_lock
  policy                = each.value.policy
  vault_name            = each.value.vault_name
  ignore_deletion_error = each.value.ignore_deletion_error
  region                = each.value.region
}
