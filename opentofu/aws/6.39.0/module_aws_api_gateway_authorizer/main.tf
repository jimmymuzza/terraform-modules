resource "aws_api_gateway_authorizer" "api_gateway_authorizers" {
  for_each = var.api_gateway_authorizers

  name                             = each.value.name
  rest_api_id                      = each.value.rest_api_id
  authorizer_credentials           = each.value.authorizer_credentials
  authorizer_result_ttl_in_seconds = each.value.authorizer_result_ttl_in_seconds
  authorizer_uri                   = each.value.authorizer_uri
  identity_source                  = each.value.identity_source
  identity_validation_expression   = each.value.identity_validation_expression
  provider_arns                    = each.value.provider_arns
  region                           = each.value.region
  type                             = each.value.type
}
