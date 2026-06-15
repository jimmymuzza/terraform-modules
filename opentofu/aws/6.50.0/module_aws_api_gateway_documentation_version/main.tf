resource "aws_api_gateway_documentation_version" "api_gateway_documentation_versions" {
  for_each = var.api_gateway_documentation_versions

  rest_api_id = each.value.rest_api_id
  version     = each.value.version
  description = each.value.description
  region      = each.value.region
}
