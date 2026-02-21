resource "azurerm_palo_alto_next_generation_firewall_virtual_network_panorama" "palo_alto_next_generation_firewall_virtual_network_panoramas" {
  for_each = var.palo_alto_next_generation_firewall_virtual_network_panoramas

  location               = each.value.location
  name                   = each.value.name
  panorama_base64_config = each.value.panorama_base64_config
  resource_group_name    = each.value.resource_group_name
  marketplace_offer_id   = each.value.marketplace_offer_id
  plan_id                = each.value.plan_id
  tags                   = each.value.tags

  dynamic "destination_nat" {
    for_each = each.value.destination_nat != null ? each.value.destination_nat : []
    content {
      name     = destination_nat.value.name
      protocol = destination_nat.value.protocol

      dynamic "backend_config" {
        for_each = destination_nat.value.backend_config != null ? destination_nat.value.backend_config : []
        content {
          port              = backend_config.value.port
          public_ip_address = backend_config.value.public_ip_address
        }
      }

      dynamic "frontend_config" {
        for_each = destination_nat.value.frontend_config != null ? destination_nat.value.frontend_config : []
        content {
          port                 = frontend_config.value.port
          public_ip_address_id = frontend_config.value.public_ip_address_id
        }
      }
    }
  }

  dynamic "dns_settings" {
    for_each = each.value.dns_settings != null ? each.value.dns_settings : []
    content {
      dns_servers   = dns_settings.value.dns_servers
      use_azure_dns = dns_settings.value.use_azure_dns
    }
  }

  dynamic "network_profile" {
    for_each = each.value.network_profile != null ? each.value.network_profile : []
    content {
      public_ip_address_ids     = network_profile.value.public_ip_address_ids
      egress_nat_ip_address_ids = network_profile.value.egress_nat_ip_address_ids
      trusted_address_ranges    = network_profile.value.trusted_address_ranges

      dynamic "vnet_configuration" {
        for_each = network_profile.value.vnet_configuration != null ? network_profile.value.vnet_configuration : []
        content {
          virtual_network_id  = vnet_configuration.value.virtual_network_id
          trusted_subnet_id   = vnet_configuration.value.trusted_subnet_id
          untrusted_subnet_id = vnet_configuration.value.untrusted_subnet_id
        }
      }
    }
  }
}
