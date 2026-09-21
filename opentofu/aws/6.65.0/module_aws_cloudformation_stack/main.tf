resource "aws_cloudformation_stack" "cloudformation_stacks" {
  for_each = var.cloudformation_stacks

  name               = each.value.name
  capabilities       = each.value.capabilities
  disable_rollback   = each.value.disable_rollback
  iam_role_arn       = each.value.iam_role_arn
  notification_arns  = each.value.notification_arns
  on_failure         = each.value.on_failure
  parameters         = each.value.parameters
  policy_body        = each.value.policy_body
  policy_url         = each.value.policy_url
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
  template_body      = each.value.template_body
  template_url       = each.value.template_url
  timeout_in_minutes = each.value.timeout_in_minutes
}
