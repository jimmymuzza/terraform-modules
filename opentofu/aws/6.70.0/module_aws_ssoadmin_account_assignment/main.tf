resource "aws_ssoadmin_account_assignment" "ssoadmin_account_assignments" {
  for_each = var.ssoadmin_account_assignments

  instance_arn       = each.value.instance_arn
  permission_set_arn = each.value.permission_set_arn
  principal_id       = each.value.principal_id
  principal_type     = each.value.principal_type
  target_id          = each.value.target_id
  target_type        = each.value.target_type
  region             = each.value.region
}
