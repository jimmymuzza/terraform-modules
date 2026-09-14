resource "aws_cognito_identity_pool" "cognito_identity_pools" {
  for_each = var.cognito_identity_pools

  identity_pool_name               = each.value.identity_pool_name
  allow_classic_flow               = each.value.allow_classic_flow
  allow_unauthenticated_identities = each.value.allow_unauthenticated_identities
  developer_provider_name          = each.value.developer_provider_name
  openid_connect_provider_arns     = each.value.openid_connect_provider_arns
  region                           = each.value.region
  saml_provider_arns               = each.value.saml_provider_arns
  supported_login_providers        = each.value.supported_login_providers
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all

  dynamic "cognito_identity_providers" {
    for_each = each.value.cognito_identity_providers != null ? each.value.cognito_identity_providers : []
    content {
      client_id               = cognito_identity_providers.value.client_id
      provider_name           = cognito_identity_providers.value.provider_name
      server_side_token_check = cognito_identity_providers.value.server_side_token_check
    }
  }
}
