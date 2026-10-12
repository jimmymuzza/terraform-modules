resource "aws_api_gateway_request_validator" "api_gateway_request_validators" {
  for_each = var.api_gateway_request_validators

  name                        = each.value.name
  rest_api_id                 = each.value.rest_api_id
  region                      = each.value.region
  validate_request_body       = each.value.validate_request_body
  validate_request_parameters = each.value.validate_request_parameters
}
