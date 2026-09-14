resource "aws_api_gateway_method" "api_gateway_methods" {
  for_each = var.api_gateway_methods

  authorization        = each.value.authorization
  http_method          = each.value.http_method
  resource_id          = each.value.resource_id
  rest_api_id          = each.value.rest_api_id
  api_key_required     = each.value.api_key_required
  authorization_scopes = each.value.authorization_scopes
  authorizer_id        = each.value.authorizer_id
  operation_name       = each.value.operation_name
  region               = each.value.region
  request_models       = each.value.request_models
  request_parameters   = each.value.request_parameters
  request_validator_id = each.value.request_validator_id
}
