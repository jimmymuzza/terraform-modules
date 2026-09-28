resource "aws_cognito_user_in_group" "cognito_user_in_groups" {
  for_each = var.cognito_user_in_groups

  group_name   = each.value.group_name
  user_pool_id = each.value.user_pool_id
  username     = each.value.username
  region       = each.value.region
}
