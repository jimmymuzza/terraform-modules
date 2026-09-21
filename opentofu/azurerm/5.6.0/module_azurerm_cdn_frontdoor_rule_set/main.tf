resource "azurerm_cdn_frontdoor_rule_set" "cdn_frontdoor_rule_sets" {
  for_each = var.cdn_frontdoor_rule_sets

  cdn_frontdoor_profile_id = each.value.cdn_frontdoor_profile_id
  name                     = each.value.name
}
