resource "aws_apigatewayv2_model" "apigatewayv2_models" {
  for_each = var.apigatewayv2_models

  api_id       = each.value.api_id
  content_type = each.value.content_type
  name         = each.value.name
  schema       = each.value.schema
  description  = each.value.description
  region       = each.value.region
}
