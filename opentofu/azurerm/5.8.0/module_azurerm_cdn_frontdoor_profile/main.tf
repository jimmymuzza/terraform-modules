resource "azurerm_cdn_frontdoor_profile" "cdn_frontdoor_profiles" {
  for_each = var.cdn_frontdoor_profiles

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  sku_name                 = each.value.sku_name
  response_timeout_seconds = each.value.response_timeout_seconds
  tags                     = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "log_scrubbing_rule" {
    for_each = each.value.log_scrubbing_rule != null ? each.value.log_scrubbing_rule : []
    content {
      match_variable = log_scrubbing_rule.value.match_variable
    }
  }
}
