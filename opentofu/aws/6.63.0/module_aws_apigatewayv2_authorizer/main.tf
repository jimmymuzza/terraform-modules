resource "aws_apigatewayv2_authorizer" "apigatewayv2_authorizers" {
  for_each = var.apigatewayv2_authorizers

  api_id                            = each.value.api_id
  authorizer_type                   = each.value.authorizer_type
  name                              = each.value.name
  authorizer_credentials_arn        = each.value.authorizer_credentials_arn
  authorizer_payload_format_version = each.value.authorizer_payload_format_version
  authorizer_result_ttl_in_seconds  = each.value.authorizer_result_ttl_in_seconds
  authorizer_uri                    = each.value.authorizer_uri
  enable_simple_responses           = each.value.enable_simple_responses
  identity_sources                  = each.value.identity_sources
  region                            = each.value.region

  dynamic "jwt_configuration" {
    for_each = each.value.jwt_configuration != null ? each.value.jwt_configuration : []
    content {
      audience = jwt_configuration.value.audience
      issuer   = jwt_configuration.value.issuer
    }
  }
}
