resource "aws_apigatewayv2_integration_response" "apigatewayv2_integration_responses" {
  for_each = var.apigatewayv2_integration_responses

  api_id                        = each.value.api_id
  integration_id                = each.value.integration_id
  integration_response_key      = each.value.integration_response_key
  content_handling_strategy     = each.value.content_handling_strategy
  region                        = each.value.region
  response_templates            = each.value.response_templates
  template_selection_expression = each.value.template_selection_expression
}
