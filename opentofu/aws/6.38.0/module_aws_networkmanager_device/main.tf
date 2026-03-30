resource "aws_networkmanager_device" "networkmanager_devices" {
  for_each = var.networkmanager_devices

  global_network_id = each.value.global_network_id
  description       = each.value.description
  model             = each.value.model
  serial_number     = each.value.serial_number
  site_id           = each.value.site_id
  tags              = each.value.tags
  tags_all          = each.value.tags_all
  type              = each.value.type
  vendor            = each.value.vendor

  dynamic "aws_location" {
    for_each = each.value.aws_location != null ? each.value.aws_location : []
    content {
      subnet_arn = aws_location.value.subnet_arn
      zone       = aws_location.value.zone
    }
  }

  dynamic "location" {
    for_each = each.value.location != null ? each.value.location : []
    content {
      address   = location.value.address
      latitude  = location.value.latitude
      longitude = location.value.longitude
    }
  }
}
