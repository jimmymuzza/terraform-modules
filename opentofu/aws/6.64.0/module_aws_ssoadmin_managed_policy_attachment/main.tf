resource "aws_ssoadmin_managed_policy_attachment" "ssoadmin_managed_policy_attachments" {
  for_each = var.ssoadmin_managed_policy_attachments

  instance_arn       = each.value.instance_arn
  managed_policy_arn = each.value.managed_policy_arn
  permission_set_arn = each.value.permission_set_arn
  region             = each.value.region
}
