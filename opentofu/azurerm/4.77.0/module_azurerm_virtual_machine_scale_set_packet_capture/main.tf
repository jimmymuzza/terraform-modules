resource "azurerm_virtual_machine_scale_set_packet_capture" "virtual_machine_scale_set_packet_captures" {
  for_each = var.virtual_machine_scale_set_packet_captures

  name                                = each.value.name
  network_watcher_id                  = each.value.network_watcher_id
  virtual_machine_scale_set_id        = each.value.virtual_machine_scale_set_id
  maximum_bytes_per_packet            = each.value.maximum_bytes_per_packet
  maximum_bytes_per_session           = each.value.maximum_bytes_per_session
  maximum_capture_duration_in_seconds = each.value.maximum_capture_duration_in_seconds

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

  dynamic "machine_scope" {
    for_each = each.value.machine_scope != null ? each.value.machine_scope : []
    content {
      exclude_instance_ids = machine_scope.value.exclude_instance_ids
      include_instance_ids = machine_scope.value.include_instance_ids
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
