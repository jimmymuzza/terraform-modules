resource "aws_efs_file_system_policy" "efs_file_system_policies" {
  for_each = var.efs_file_system_policies

  file_system_id                     = each.value.file_system_id
  policy                             = each.value.policy
  bypass_policy_lockout_safety_check = each.value.bypass_policy_lockout_safety_check
  region                             = each.value.region
}
