resource "aws_kms_replica_key" "kms_replica_keys" {
  for_each = var.kms_replica_keys

  primary_key_arn                    = each.value.primary_key_arn
  bypass_policy_lockout_safety_check = each.value.bypass_policy_lockout_safety_check
  deletion_window_in_days            = each.value.deletion_window_in_days
  description                        = each.value.description
  enabled                            = each.value.enabled
  policy                             = each.value.policy
  region                             = each.value.region
  tags                               = each.value.tags
  tags_all                           = each.value.tags_all
}
