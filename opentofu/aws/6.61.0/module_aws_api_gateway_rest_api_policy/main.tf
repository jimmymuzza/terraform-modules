resource "aws_api_gateway_rest_api_policy" "api_gateway_rest_api_policies" {
  for_each = var.api_gateway_rest_api_policies

  policy      = each.value.policy
  rest_api_id = each.value.rest_api_id
  region      = each.value.region
}
