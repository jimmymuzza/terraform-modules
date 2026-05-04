resource "aws_api_gateway_resource" "api_gateway_resources" {
  for_each = var.api_gateway_resources

  parent_id   = each.value.parent_id
  path_part   = each.value.path_part
  rest_api_id = each.value.rest_api_id
  region      = each.value.region
}
