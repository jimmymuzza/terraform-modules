resource "aws_wafv2_api_key" "wafv2_api_keys" {
  for_each = var.wafv2_api_keys

  scope         = each.value.scope
  token_domains = each.value.token_domains
  region        = each.value.region
}
