resource "aws_secretsmanager_secret" "secretsmanager_secrets" {
  for_each = var.secretsmanager_secrets

  description                    = each.value.description
  force_overwrite_replica_secret = each.value.force_overwrite_replica_secret
  kms_key_id                     = each.value.kms_key_id
  name                           = each.value.name
  name_prefix                    = each.value.name_prefix
  policy                         = each.value.policy
  recovery_window_in_days        = each.value.recovery_window_in_days
  region                         = each.value.region
  tags                           = each.value.tags
  tags_all                       = each.value.tags_all

  dynamic "replica" {
    for_each = each.value.replica != null ? each.value.replica : []
    content {
      region     = replica.value.region
      kms_key_id = replica.value.kms_key_id
    }
  }
}
