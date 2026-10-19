resource "aws_ssoadmin_permission_set_inline_policy" "ssoadmin_permission_set_inline_policies" {
  for_each = var.ssoadmin_permission_set_inline_policies

  inline_policy      = each.value.inline_policy
  instance_arn       = each.value.instance_arn
  permission_set_arn = each.value.permission_set_arn
  region             = each.value.region
}
