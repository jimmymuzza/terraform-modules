resource "aws_ssoadmin_managed_policy_attachments_exclusive" "ssoadmin_managed_policy_attachments_exclusives" {
  for_each = var.ssoadmin_managed_policy_attachments_exclusives

  instance_arn        = each.value.instance_arn
  managed_policy_arns = each.value.managed_policy_arns
  permission_set_arn  = each.value.permission_set_arn
  region              = each.value.region
}
