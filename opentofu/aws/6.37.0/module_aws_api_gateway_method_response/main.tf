resource "aws_api_gateway_method_response" "api_gateway_method_responses" {
  for_each = var.api_gateway_method_responses

  http_method         = each.value.http_method
  resource_id         = each.value.resource_id
  rest_api_id         = each.value.rest_api_id
  status_code         = each.value.status_code
  region              = each.value.region
  response_models     = each.value.response_models
  response_parameters = each.value.response_parameters
}
