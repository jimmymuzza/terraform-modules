resource "azurerm_system_center_virtual_machine_manager_virtual_machine_instance" "system_center_virtual_machine_manager_virtual_machine_instances" {
  for_each = var.system_center_virtual_machine_manager_virtual_machine_instances

  custom_location_id                                         = each.value.custom_location_id
  scoped_resource_id                                         = each.value.scoped_resource_id
  system_center_virtual_machine_manager_availability_set_ids = each.value.system_center_virtual_machine_manager_availability_set_ids

  dynamic "hardware" {
    for_each = each.value.hardware != null ? each.value.hardware : []
    content {
      cpu_count                       = hardware.value.cpu_count
      dynamic_memory_max_in_mb        = hardware.value.dynamic_memory_max_in_mb
      dynamic_memory_min_in_mb        = hardware.value.dynamic_memory_min_in_mb
      limit_cpu_for_migration_enabled = hardware.value.limit_cpu_for_migration_enabled
      memory_in_mb                    = hardware.value.memory_in_mb
    }
  }

  dynamic "infrastructure" {
    for_each = each.value.infrastructure != null ? each.value.infrastructure : []
    content {
      checkpoint_type                                                 = infrastructure.value.checkpoint_type
      system_center_virtual_machine_manager_cloud_id                  = infrastructure.value.system_center_virtual_machine_manager_cloud_id
      system_center_virtual_machine_manager_inventory_item_id         = infrastructure.value.system_center_virtual_machine_manager_inventory_item_id
      system_center_virtual_machine_manager_template_id               = infrastructure.value.system_center_virtual_machine_manager_template_id
      system_center_virtual_machine_manager_virtual_machine_server_id = infrastructure.value.system_center_virtual_machine_manager_virtual_machine_server_id
    }
  }

  dynamic "network_interface" {
    for_each = each.value.network_interface != null ? each.value.network_interface : []
    content {
      name               = network_interface.value.name
      ipv4_address_type  = network_interface.value.ipv4_address_type
      ipv6_address_type  = network_interface.value.ipv6_address_type
      mac_address_type   = network_interface.value.mac_address_type
      virtual_network_id = network_interface.value.virtual_network_id
    }
  }

  dynamic "operating_system" {
    for_each = each.value.operating_system != null ? each.value.operating_system : []
    content {
      admin_password = operating_system.value.admin_password
      computer_name  = operating_system.value.computer_name
    }
  }

  dynamic "storage_disk" {
    for_each = each.value.storage_disk != null ? each.value.storage_disk : []
    content {
      bus                     = storage_disk.value.bus
      bus_type                = storage_disk.value.bus_type
      disk_size_gb            = storage_disk.value.disk_size_gb
      lun                     = storage_disk.value.lun
      name                    = storage_disk.value.name
      storage_qos_policy_name = storage_disk.value.storage_qos_policy_name
      template_disk_id        = storage_disk.value.template_disk_id
      vhd_type                = storage_disk.value.vhd_type
    }
  }
}
