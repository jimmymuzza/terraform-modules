resource "aws_quicksight_user" "quicksight_users" {
  for_each = var.quicksight_users

  email          = each.value.email
  identity_type  = each.value.identity_type
  user_role      = each.value.user_role
  aws_account_id = each.value.aws_account_id
  iam_arn        = each.value.iam_arn
  namespace      = each.value.namespace
  region         = each.value.region
  session_name   = each.value.session_name
  user_name      = each.value.user_name
}
