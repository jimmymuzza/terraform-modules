resource "aws_xray_resource_policy" "xray_resource_policies" {
  for_each = var.xray_resource_policies

  policy_document             = each.value.policy_document
  policy_name                 = each.value.policy_name
  bypass_policy_lockout_check = each.value.bypass_policy_lockout_check
  policy_revision_id          = each.value.policy_revision_id
  region                      = each.value.region
}
