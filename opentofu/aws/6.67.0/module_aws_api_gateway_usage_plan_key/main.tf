resource "aws_api_gateway_usage_plan_key" "api_gateway_usage_plan_keys" {
  for_each = var.api_gateway_usage_plan_keys

  key_id        = each.value.key_id
  key_type      = each.value.key_type
  usage_plan_id = each.value.usage_plan_id
  region        = each.value.region
}
