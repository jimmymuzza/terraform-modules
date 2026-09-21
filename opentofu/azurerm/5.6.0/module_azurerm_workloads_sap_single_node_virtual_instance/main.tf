resource "azurerm_workloads_sap_single_node_virtual_instance" "workloads_sap_single_node_virtual_instances" {
  for_each = var.workloads_sap_single_node_virtual_instances

  app_location                          = each.value.app_location
  environment                           = each.value.environment
  location                              = each.value.location
  name                                  = each.value.name
  resource_group_name                   = each.value.resource_group_name
  sap_fqdn                              = each.value.sap_fqdn
  sap_product                           = each.value.sap_product
  managed_resource_group_name           = each.value.managed_resource_group_name
  managed_resources_network_access_type = each.value.managed_resources_network_access_type
  tags                                  = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "single_server_configuration" {
    for_each = each.value.single_server_configuration != null ? each.value.single_server_configuration : []
    content {
      app_resource_group_name = single_server_configuration.value.app_resource_group_name
      subnet_id               = single_server_configuration.value.subnet_id
      database_type           = single_server_configuration.value.database_type
      secondary_ip_enabled    = single_server_configuration.value.secondary_ip_enabled

      dynamic "disk_volume_configuration" {
        for_each = single_server_configuration.value.disk_volume_configuration != null ? single_server_configuration.value.disk_volume_configuration : []
        content {
          number_of_disks = disk_volume_configuration.value.number_of_disks
          size_in_gb      = disk_volume_configuration.value.size_in_gb
          sku_name        = disk_volume_configuration.value.sku_name
          volume_name     = disk_volume_configuration.value.volume_name
        }
      }

      dynamic "virtual_machine_configuration" {
        for_each = single_server_configuration.value.virtual_machine_configuration != null ? single_server_configuration.value.virtual_machine_configuration : []
        content {
          virtual_machine_size = virtual_machine_configuration.value.virtual_machine_size

          dynamic "image" {
            for_each = virtual_machine_configuration.value.image != null ? virtual_machine_configuration.value.image : []
            content {
              offer     = image.value.offer
              publisher = image.value.publisher
              sku       = image.value.sku
              version   = image.value.version
            }
          }

          dynamic "os_profile" {
            for_each = virtual_machine_configuration.value.os_profile != null ? virtual_machine_configuration.value.os_profile : []
            content {
              admin_username  = os_profile.value.admin_username
              ssh_private_key = os_profile.value.ssh_private_key
              ssh_public_key  = os_profile.value.ssh_public_key
            }
          }
        }
      }

      dynamic "virtual_machine_resource_names" {
        for_each = single_server_configuration.value.virtual_machine_resource_names != null ? single_server_configuration.value.virtual_machine_resource_names : []
        content {
          host_name               = virtual_machine_resource_names.value.host_name
          network_interface_names = virtual_machine_resource_names.value.network_interface_names
          os_disk_name            = virtual_machine_resource_names.value.os_disk_name
          virtual_machine_name    = virtual_machine_resource_names.value.virtual_machine_name

          dynamic "data_disk" {
            for_each = virtual_machine_resource_names.value.data_disk != null ? virtual_machine_resource_names.value.data_disk : []
            content {
              names       = data_disk.value.names
              volume_name = data_disk.value.volume_name
            }
          }
        }
      }
    }
  }
}
