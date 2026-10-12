resource "aws_organizations_policy_attachment" "organizations_policy_attachments" {
  for_each = var.organizations_policy_attachments

  policy_id    = each.value.policy_id
  target_id    = each.value.target_id
  skip_destroy = each.value.skip_destroy
}
