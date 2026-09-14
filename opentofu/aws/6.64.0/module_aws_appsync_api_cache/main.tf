resource "aws_appsync_api_cache" "appsync_api_caches" {
  for_each = var.appsync_api_caches

  api_caching_behavior       = each.value.api_caching_behavior
  api_id                     = each.value.api_id
  ttl                        = each.value.ttl
  type                       = each.value.type
  at_rest_encryption_enabled = each.value.at_rest_encryption_enabled
  region                     = each.value.region
  transit_encryption_enabled = each.value.transit_encryption_enabled
}
