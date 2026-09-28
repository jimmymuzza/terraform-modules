resource "azurerm_private_endpoint" "private_endpoints" {
  for_each = var.private_endpoints

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  subnet_id                     = each.value.subnet_id
  custom_network_interface_name = each.value.custom_network_interface_name
  edge_zone                     = each.value.edge_zone
  tags                          = each.value.tags

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration != null ? each.value.ip_configuration : []
    content {
      name               = ip_configuration.value.name
      private_ip_address = ip_configuration.value.private_ip_address
      member_name        = ip_configuration.value.member_name
      subresource_name   = ip_configuration.value.subresource_name
    }
  }

  dynamic "private_dns_zone_group" {
    for_each = each.value.private_dns_zone_group != null ? each.value.private_dns_zone_group : []
    content {
      name                 = private_dns_zone_group.value.name
      private_dns_zone_ids = private_dns_zone_group.value.private_dns_zone_ids
    }
  }

  dynamic "private_service_connection" {
    for_each = each.value.private_service_connection != null ? each.value.private_service_connection : []
    content {
      is_manual_connection              = private_service_connection.value.is_manual_connection
      name                              = private_service_connection.value.name
      private_connection_resource_alias = private_service_connection.value.private_connection_resource_alias
      private_connection_resource_id    = private_service_connection.value.private_connection_resource_id
      request_message                   = private_service_connection.value.request_message
      subresource_names                 = private_service_connection.value.subresource_names
    }
  }
}
