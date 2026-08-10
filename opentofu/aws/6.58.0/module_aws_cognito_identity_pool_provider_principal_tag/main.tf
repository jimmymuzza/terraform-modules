resource "aws_cognito_identity_pool_provider_principal_tag" "cognito_identity_pool_provider_principal_tags" {
  for_each = var.cognito_identity_pool_provider_principal_tags

  identity_pool_id       = each.value.identity_pool_id
  identity_provider_name = each.value.identity_provider_name
  principal_tags         = each.value.principal_tags
  region                 = each.value.region
  use_defaults           = each.value.use_defaults
}
