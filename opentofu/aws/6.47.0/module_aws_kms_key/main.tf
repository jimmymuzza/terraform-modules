resource "aws_kms_key" "kms_keys" {
  for_each = var.kms_keys

  bypass_policy_lockout_safety_check = each.value.bypass_policy_lockout_safety_check
  custom_key_store_id                = each.value.custom_key_store_id
  customer_master_key_spec           = each.value.customer_master_key_spec
  deletion_window_in_days            = each.value.deletion_window_in_days
  description                        = each.value.description
  enable_key_rotation                = each.value.enable_key_rotation
  is_enabled                         = each.value.is_enabled
  key_usage                          = each.value.key_usage
  multi_region                       = each.value.multi_region
  policy                             = each.value.policy
  region                             = each.value.region
  rotation_period_in_days            = each.value.rotation_period_in_days
  tags                               = each.value.tags
  tags_all                           = each.value.tags_all
  xks_key_id                         = each.value.xks_key_id
}
