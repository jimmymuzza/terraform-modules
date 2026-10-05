resource "aws_networkmanager_site" "networkmanager_sites" {
  for_each = var.networkmanager_sites

  global_network_id = each.value.global_network_id
  description       = each.value.description
  tags              = each.value.tags
  tags_all          = each.value.tags_all

  dynamic "location" {
    for_each = each.value.location != null ? each.value.location : []
    content {
      address   = location.value.address
      latitude  = location.value.latitude
      longitude = location.value.longitude
    }
  }
}
