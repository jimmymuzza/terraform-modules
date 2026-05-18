resource "azurerm_cdn_frontdoor_custom_domain_association" "cdn_frontdoor_custom_domain_associations" {
  for_each = var.cdn_frontdoor_custom_domain_associations

  cdn_frontdoor_custom_domain_id = each.value.cdn_frontdoor_custom_domain_id
  cdn_frontdoor_route_ids        = each.value.cdn_frontdoor_route_ids
}
