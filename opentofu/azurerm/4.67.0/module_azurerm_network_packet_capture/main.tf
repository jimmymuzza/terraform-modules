resource "azurerm_network_packet_capture" "network_packet_captures" {
  for_each = var.network_packet_captures

  name                      = each.value.name
  network_watcher_name      = each.value.network_watcher_name
  resource_group_name       = each.value.resource_group_name
  target_resource_id        = each.value.target_resource_id
  maximum_bytes_per_packet  = each.value.maximum_bytes_per_packet
  maximum_bytes_per_session = each.value.maximum_bytes_per_session
  maximum_capture_duration  = each.value.maximum_capture_duration

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      protocol          = filter.value.protocol
      local_ip_address  = filter.value.local_ip_address
      local_port        = filter.value.local_port
      remote_ip_address = filter.value.remote_ip_address
      remote_port       = filter.value.remote_port
    }
  }

  dynamic "storage_location" {
    for_each = each.value.storage_location != null ? each.value.storage_location : []
    content {
      file_path          = storage_location.value.file_path
      storage_account_id = storage_location.value.storage_account_id
    }
  }
}
