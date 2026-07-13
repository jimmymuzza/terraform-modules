resource "aws_api_gateway_rest_api_put" "api_gateway_rest_api_puts" {
  for_each = var.api_gateway_rest_api_puts

  body             = each.value.body
  rest_api_id      = each.value.rest_api_id
  fail_on_warnings = each.value.fail_on_warnings
  parameters       = each.value.parameters
  region           = each.value.region
  triggers         = each.value.triggers
}
