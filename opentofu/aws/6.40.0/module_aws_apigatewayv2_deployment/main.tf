resource "aws_apigatewayv2_deployment" "apigatewayv2_deployments" {
  for_each = var.apigatewayv2_deployments

  api_id      = each.value.api_id
  description = each.value.description
  region      = each.value.region
  triggers    = each.value.triggers
}
