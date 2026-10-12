resource "aws_quicksight_role_custom_permission" "quicksight_role_custom_permissions" {
  for_each = var.quicksight_role_custom_permissions

  custom_permissions_name = each.value.custom_permissions_name
  role                    = each.value.role
  aws_account_id          = each.value.aws_account_id
  namespace               = each.value.namespace
  region                  = each.value.region
}
