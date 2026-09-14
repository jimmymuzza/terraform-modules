resource "aws_apigatewayv2_route_response" "apigatewayv2_route_responses" {
  for_each = var.apigatewayv2_route_responses

  api_id                     = each.value.api_id
  route_id                   = each.value.route_id
  route_response_key         = each.value.route_response_key
  model_selection_expression = each.value.model_selection_expression
  region                     = each.value.region
  response_models            = each.value.response_models
}
