resource "aws_api_gateway_api_key" "api_gateway_api_keys" {
  for_each = var.api_gateway_api_keys

  name        = each.value.name
  customer_id = each.value.customer_id
  description = each.value.description
  enabled     = each.value.enabled
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
  value       = each.value.value
}
