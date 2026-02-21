resource "aws_apigatewayv2_api" "apigatewayv2_apis" {
  for_each = var.apigatewayv2_apis

  name                         = each.value.name
  protocol_type                = each.value.protocol_type
  api_key_selection_expression = each.value.api_key_selection_expression
  body                         = each.value.body
  credentials_arn              = each.value.credentials_arn
  description                  = each.value.description
  disable_execute_api_endpoint = each.value.disable_execute_api_endpoint
  fail_on_warnings             = each.value.fail_on_warnings
  ip_address_type              = each.value.ip_address_type
  region                       = each.value.region
  route_key                    = each.value.route_key
  route_selection_expression   = each.value.route_selection_expression
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all
  target                       = each.value.target
  version                      = each.value.version

  dynamic "cors_configuration" {
    for_each = each.value.cors_configuration != null ? each.value.cors_configuration : []
    content {
      allow_credentials = cors_configuration.value.allow_credentials
      allow_headers     = cors_configuration.value.allow_headers
      allow_methods     = cors_configuration.value.allow_methods
      allow_origins     = cors_configuration.value.allow_origins
      expose_headers    = cors_configuration.value.expose_headers
      max_age           = cors_configuration.value.max_age
    }
  }
}
