resource "azurerm_firewall" "firewalls" {
  for_each = var.firewalls

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  sku_tier            = each.value.sku_tier
  dns_proxy_enabled   = each.value.dns_proxy_enabled
  dns_servers         = each.value.dns_servers
  firewall_policy_id  = each.value.firewall_policy_id
  private_ip_ranges   = each.value.private_ip_ranges
  tags                = each.value.tags
  threat_intel_mode   = each.value.threat_intel_mode
  zones               = each.value.zones

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration != null ? each.value.ip_configuration : []
    content {
      name                 = ip_configuration.value.name
      public_ip_address_id = ip_configuration.value.public_ip_address_id
      subnet_id            = ip_configuration.value.subnet_id
    }
  }

  dynamic "management_ip_configuration" {
    for_each = each.value.management_ip_configuration != null ? each.value.management_ip_configuration : []
    content {
      name                 = management_ip_configuration.value.name
      public_ip_address_id = management_ip_configuration.value.public_ip_address_id
      subnet_id            = management_ip_configuration.value.subnet_id
    }
  }

  dynamic "virtual_hub" {
    for_each = each.value.virtual_hub != null ? each.value.virtual_hub : []
    content {
      virtual_hub_id  = virtual_hub.value.virtual_hub_id
      public_ip_count = virtual_hub.value.public_ip_count
    }
  }
}
