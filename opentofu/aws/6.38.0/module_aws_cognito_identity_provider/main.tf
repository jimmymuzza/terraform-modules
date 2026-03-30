resource "aws_cognito_identity_provider" "cognito_identity_providers" {
  for_each = var.cognito_identity_providers

  provider_details  = each.value.provider_details
  provider_name     = each.value.provider_name
  provider_type     = each.value.provider_type
  user_pool_id      = each.value.user_pool_id
  attribute_mapping = each.value.attribute_mapping
  idp_identifiers   = each.value.idp_identifiers
  region            = each.value.region
}
