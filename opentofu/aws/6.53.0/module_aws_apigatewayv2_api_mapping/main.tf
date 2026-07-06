resource "aws_apigatewayv2_api_mapping" "apigatewayv2_api_mappings" {
  for_each = var.apigatewayv2_api_mappings

  api_id          = each.value.api_id
  domain_name     = each.value.domain_name
  stage           = each.value.stage
  api_mapping_key = each.value.api_mapping_key
  region          = each.value.region
}
