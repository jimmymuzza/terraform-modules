resource "aws_kms_key_policy" "kms_key_policies" {
  for_each = var.kms_key_policies

  key_id                             = each.value.key_id
  policy                             = each.value.policy
  bypass_policy_lockout_safety_check = each.value.bypass_policy_lockout_safety_check
  region                             = each.value.region
}
