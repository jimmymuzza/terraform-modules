resource "aws_kms_external_key" "kms_external_keys" {
  for_each = var.kms_external_keys

  bypass_policy_lockout_safety_check = each.value.bypass_policy_lockout_safety_check
  deletion_window_in_days            = each.value.deletion_window_in_days
  description                        = each.value.description
  enabled                            = each.value.enabled
  key_material_base64                = each.value.key_material_base64
  key_spec                           = each.value.key_spec
  key_usage                          = each.value.key_usage
  multi_region                       = each.value.multi_region
  policy                             = each.value.policy
  region                             = each.value.region
  tags                               = each.value.tags
  tags_all                           = each.value.tags_all
  valid_to                           = each.value.valid_to
}
