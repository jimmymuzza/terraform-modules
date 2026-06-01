resource "aws_api_gateway_gateway_response" "api_gateway_gateway_responses" {
  for_each = var.api_gateway_gateway_responses

  response_type       = each.value.response_type
  rest_api_id         = each.value.rest_api_id
  region              = each.value.region
  response_parameters = each.value.response_parameters
  response_templates  = each.value.response_templates
  status_code         = each.value.status_code
}
