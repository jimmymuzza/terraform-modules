resource "aws_quicksight_user_custom_permission" "quicksight_user_custom_permissions" {
  for_each = var.quicksight_user_custom_permissions

  custom_permissions_name = each.value.custom_permissions_name
  user_name               = each.value.user_name
  aws_account_id          = each.value.aws_account_id
  namespace               = each.value.namespace
  region                  = each.value.region
}
