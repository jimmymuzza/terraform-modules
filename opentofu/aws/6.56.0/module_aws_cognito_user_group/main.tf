resource "aws_cognito_user_group" "cognito_user_groups" {
  for_each = var.cognito_user_groups

  name         = each.value.name
  user_pool_id = each.value.user_pool_id
  description  = each.value.description
  precedence   = each.value.precedence
  region       = each.value.region
  role_arn     = each.value.role_arn
}
