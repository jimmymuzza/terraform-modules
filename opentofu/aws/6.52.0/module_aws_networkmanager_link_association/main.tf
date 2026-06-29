resource "aws_networkmanager_link_association" "networkmanager_link_associations" {
  for_each = var.networkmanager_link_associations

  device_id         = each.value.device_id
  global_network_id = each.value.global_network_id
  link_id           = each.value.link_id
}
