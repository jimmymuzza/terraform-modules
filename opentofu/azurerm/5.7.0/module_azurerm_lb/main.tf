resource "azurerm_lb" "lbs" {
  for_each = var.lbs

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  edge_zone           = each.value.edge_zone
  sku                 = each.value.sku
  sku_tier            = each.value.sku_tier
  tags                = each.value.tags

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration != null ? each.value.frontend_ip_configuration : []
    content {
      name                                               = frontend_ip_configuration.value.name
      gateway_load_balancer_frontend_ip_configuration_id = frontend_ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id
      private_ip_address                                 = frontend_ip_configuration.value.private_ip_address
      private_ip_address_allocation                      = frontend_ip_configuration.value.private_ip_address_allocation
      private_ip_address_version                         = frontend_ip_configuration.value.private_ip_address_version
      public_ip_address_id                               = frontend_ip_configuration.value.public_ip_address_id
      public_ip_prefix_id                                = frontend_ip_configuration.value.public_ip_prefix_id
      subnet_id                                          = frontend_ip_configuration.value.subnet_id
      zones                                              = frontend_ip_configuration.value.zones
    }
  }
}
