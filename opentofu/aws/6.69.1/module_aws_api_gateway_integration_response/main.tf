resource "aws_api_gateway_integration_response" "api_gateway_integration_responses" {
  for_each = var.api_gateway_integration_responses

  http_method         = each.value.http_method
  resource_id         = each.value.resource_id
  rest_api_id         = each.value.rest_api_id
  status_code         = each.value.status_code
  content_handling    = each.value.content_handling
  region              = each.value.region
  response_parameters = each.value.response_parameters
  response_templates  = each.value.response_templates
  selection_pattern   = each.value.selection_pattern
}
