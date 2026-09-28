resource "aws_api_gateway_deployment" "api_gateway_deployments" {
  for_each = var.api_gateway_deployments

  rest_api_id = each.value.rest_api_id
  description = each.value.description
  region      = each.value.region
  triggers    = each.value.triggers
  variables   = each.value.variables
}
