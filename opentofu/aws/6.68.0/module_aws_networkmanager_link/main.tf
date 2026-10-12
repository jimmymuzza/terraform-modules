resource "aws_networkmanager_link" "networkmanager_links" {
  for_each = var.networkmanager_links

  global_network_id = each.value.global_network_id
  site_id           = each.value.site_id
  description       = each.value.description
  provider_name     = each.value.provider_name
  tags              = each.value.tags
  tags_all          = each.value.tags_all
  type              = each.value.type

  dynamic "bandwidth" {
    for_each = each.value.bandwidth != null ? each.value.bandwidth : []
    content {
      download_speed = bandwidth.value.download_speed
      upload_speed   = bandwidth.value.upload_speed
    }
  }
}
