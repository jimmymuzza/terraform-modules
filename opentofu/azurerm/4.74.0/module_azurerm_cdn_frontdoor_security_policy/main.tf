resource "azurerm_cdn_frontdoor_security_policy" "cdn_frontdoor_security_policies" {
  for_each = var.cdn_frontdoor_security_policies

  cdn_frontdoor_profile_id = each.value.cdn_frontdoor_profile_id
  name                     = each.value.name

  dynamic "security_policies" {
    for_each = each.value.security_policies != null ? each.value.security_policies : []
    content {

      dynamic "firewall" {
        for_each = security_policies.value.firewall != null ? security_policies.value.firewall : []
        content {
          cdn_frontdoor_firewall_policy_id = firewall.value.cdn_frontdoor_firewall_policy_id

          dynamic "association" {
            for_each = firewall.value.association != null ? firewall.value.association : []
            content {
              patterns_to_match = association.value.patterns_to_match

              dynamic "domain" {
                for_each = association.value.domain != null ? association.value.domain : []
                content {
                  cdn_frontdoor_domain_id = domain.value.cdn_frontdoor_domain_id
                }
              }
            }
          }
        }
      }
    }
  }
}
