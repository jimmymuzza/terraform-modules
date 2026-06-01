resource "azurerm_cdn_frontdoor_endpoint" "cdn_frontdoor_endpoints" {
  for_each = var.cdn_frontdoor_endpoints

  cdn_frontdoor_profile_id = each.value.cdn_frontdoor_profile_id
  name                     = each.value.name
  enabled                  = each.value.enabled
  tags                     = each.value.tags
}
