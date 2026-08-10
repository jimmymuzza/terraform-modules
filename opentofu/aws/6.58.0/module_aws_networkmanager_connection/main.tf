resource "aws_networkmanager_connection" "networkmanager_connections" {
  for_each = var.networkmanager_connections

  connected_device_id = each.value.connected_device_id
  device_id           = each.value.device_id
  global_network_id   = each.value.global_network_id
  connected_link_id   = each.value.connected_link_id
  description         = each.value.description
  link_id             = each.value.link_id
  tags                = each.value.tags
  tags_all            = each.value.tags_all
}
