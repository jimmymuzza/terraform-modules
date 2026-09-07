resource "aws_api_gateway_documentation_part" "api_gateway_documentation_parts" {
  for_each = var.api_gateway_documentation_parts

  properties  = each.value.properties
  rest_api_id = each.value.rest_api_id
  region      = each.value.region

  dynamic "location" {
    for_each = each.value.location != null ? each.value.location : []
    content {
      type        = location.value.type
      method      = location.value.method
      name        = location.value.name
      path        = location.value.path
      status_code = location.value.status_code
    }
  }
}
