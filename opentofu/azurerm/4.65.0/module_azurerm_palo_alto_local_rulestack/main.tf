resource "azurerm_palo_alto_local_rulestack" "palo_alto_local_rulestacks" {
  for_each = var.palo_alto_local_rulestacks

  location              = each.value.location
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  anti_spyware_profile  = each.value.anti_spyware_profile
  anti_virus_profile    = each.value.anti_virus_profile
  description           = each.value.description
  dns_subscription      = each.value.dns_subscription
  file_blocking_profile = each.value.file_blocking_profile
  url_filtering_profile = each.value.url_filtering_profile
  vulnerability_profile = each.value.vulnerability_profile
}
