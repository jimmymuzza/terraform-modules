resource "azurerm_private_dns_resolver_inbound_endpoint" "private_dns_resolver_inbound_endpoints" {
  for_each = var.private_dns_resolver_inbound_endpoints

  location                = each.value.location
  name                    = each.value.name
  private_dns_resolver_id = each.value.private_dns_resolver_id
  tags                    = each.value.tags

  dynamic "ip_configurations" {
    for_each = each.value.ip_configurations != null ? each.value.ip_configurations : []
    content {
      subnet_id                    = ip_configurations.value.subnet_id
      private_ip_address           = ip_configurations.value.private_ip_address
      private_ip_allocation_method = ip_configurations.value.private_ip_allocation_method
    }
  }
}
