resource "aws_iam_policy" "iam_policies" {
  for_each = var.iam_policies

  policy                            = each.value.policy
  delay_after_policy_creation_in_ms = each.value.delay_after_policy_creation_in_ms
  description                       = each.value.description
  name                              = each.value.name
  name_prefix                       = each.value.name_prefix
  path                              = each.value.path
  tags                              = each.value.tags
  tags_all                          = each.value.tags_all
}
