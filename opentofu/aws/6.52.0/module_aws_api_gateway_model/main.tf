resource "aws_api_gateway_model" "api_gateway_models" {
  for_each = var.api_gateway_models

  content_type = each.value.content_type
  name         = each.value.name
  rest_api_id  = each.value.rest_api_id
  description  = each.value.description
  region       = each.value.region
  schema       = each.value.schema
}
