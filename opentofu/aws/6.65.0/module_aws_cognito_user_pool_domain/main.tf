resource "aws_cognito_user_pool_domain" "cognito_user_pool_domains" {
  for_each = var.cognito_user_pool_domains

  domain                = each.value.domain
  user_pool_id          = each.value.user_pool_id
  certificate_arn       = each.value.certificate_arn
  managed_login_version = each.value.managed_login_version
  region                = each.value.region
}
