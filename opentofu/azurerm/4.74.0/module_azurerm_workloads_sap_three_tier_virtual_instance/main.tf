resource "azurerm_workloads_sap_three_tier_virtual_instance" "workloads_sap_three_tier_virtual_instances" {
  for_each = var.workloads_sap_three_tier_virtual_instances

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

  dynamic "three_tier_configuration" {
    for_each = each.value.three_tier_configuration != null ? each.value.three_tier_configuration : []
    content {
      app_resource_group_name = three_tier_configuration.value.app_resource_group_name
      high_availability_type  = three_tier_configuration.value.high_availability_type
      secondary_ip_enabled    = three_tier_configuration.value.secondary_ip_enabled

      dynamic "application_server_configuration" {
        for_each = three_tier_configuration.value.application_server_configuration != null ? three_tier_configuration.value.application_server_configuration : []
        content {
          instance_count = application_server_configuration.value.instance_count
          subnet_id      = application_server_configuration.value.subnet_id

          dynamic "virtual_machine_configuration" {
            for_each = application_server_configuration.value.virtual_machine_configuration != null ? application_server_configuration.value.virtual_machine_configuration : []
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
        }
      }

      dynamic "central_server_configuration" {
        for_each = three_tier_configuration.value.central_server_configuration != null ? three_tier_configuration.value.central_server_configuration : []
        content {
          instance_count = central_server_configuration.value.instance_count
          subnet_id      = central_server_configuration.value.subnet_id

          dynamic "virtual_machine_configuration" {
            for_each = central_server_configuration.value.virtual_machine_configuration != null ? central_server_configuration.value.virtual_machine_configuration : []
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
        }
      }

      dynamic "database_server_configuration" {
        for_each = three_tier_configuration.value.database_server_configuration != null ? three_tier_configuration.value.database_server_configuration : []
        content {
          instance_count = database_server_configuration.value.instance_count
          subnet_id      = database_server_configuration.value.subnet_id
          database_type  = database_server_configuration.value.database_type

          dynamic "disk_volume_configuration" {
            for_each = database_server_configuration.value.disk_volume_configuration != null ? database_server_configuration.value.disk_volume_configuration : []
            content {
              number_of_disks = disk_volume_configuration.value.number_of_disks
              size_in_gb      = disk_volume_configuration.value.size_in_gb
              sku_name        = disk_volume_configuration.value.sku_name
              volume_name     = disk_volume_configuration.value.volume_name
            }
          }

          dynamic "virtual_machine_configuration" {
            for_each = database_server_configuration.value.virtual_machine_configuration != null ? database_server_configuration.value.virtual_machine_configuration : []
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
        }
      }

      dynamic "resource_names" {
        for_each = three_tier_configuration.value.resource_names != null ? three_tier_configuration.value.resource_names : []
        content {

          dynamic "application_server" {
            for_each = resource_names.value.application_server != null ? resource_names.value.application_server : []
            content {
              availability_set_name = application_server.value.availability_set_name

              dynamic "virtual_machine" {
                for_each = application_server.value.virtual_machine != null ? application_server.value.virtual_machine : []
                content {
                  host_name               = virtual_machine.value.host_name
                  network_interface_names = virtual_machine.value.network_interface_names
                  os_disk_name            = virtual_machine.value.os_disk_name
                  virtual_machine_name    = virtual_machine.value.virtual_machine_name

                  dynamic "data_disk" {
                    for_each = virtual_machine.value.data_disk != null ? virtual_machine.value.data_disk : []
                    content {
                      names       = data_disk.value.names
                      volume_name = data_disk.value.volume_name
                    }
                  }
                }
              }
            }
          }

          dynamic "central_server" {
            for_each = resource_names.value.central_server != null ? resource_names.value.central_server : []
            content {
              availability_set_name = central_server.value.availability_set_name

              dynamic "load_balancer" {
                for_each = central_server.value.load_balancer != null ? central_server.value.load_balancer : []
                content {
                  backend_pool_names              = load_balancer.value.backend_pool_names
                  frontend_ip_configuration_names = load_balancer.value.frontend_ip_configuration_names
                  health_probe_names              = load_balancer.value.health_probe_names
                  name                            = load_balancer.value.name
                }
              }

              dynamic "virtual_machine" {
                for_each = central_server.value.virtual_machine != null ? central_server.value.virtual_machine : []
                content {
                  host_name               = virtual_machine.value.host_name
                  network_interface_names = virtual_machine.value.network_interface_names
                  os_disk_name            = virtual_machine.value.os_disk_name
                  virtual_machine_name    = virtual_machine.value.virtual_machine_name

                  dynamic "data_disk" {
                    for_each = virtual_machine.value.data_disk != null ? virtual_machine.value.data_disk : []
                    content {
                      names       = data_disk.value.names
                      volume_name = data_disk.value.volume_name
                    }
                  }
                }
              }
            }
          }

          dynamic "database_server" {
            for_each = resource_names.value.database_server != null ? resource_names.value.database_server : []
            content {
              availability_set_name = database_server.value.availability_set_name

              dynamic "load_balancer" {
                for_each = database_server.value.load_balancer != null ? database_server.value.load_balancer : []
                content {
                  backend_pool_names              = load_balancer.value.backend_pool_names
                  frontend_ip_configuration_names = load_balancer.value.frontend_ip_configuration_names
                  health_probe_names              = load_balancer.value.health_probe_names
                  name                            = load_balancer.value.name
                }
              }

              dynamic "virtual_machine" {
                for_each = database_server.value.virtual_machine != null ? database_server.value.virtual_machine : []
                content {
                  host_name               = virtual_machine.value.host_name
                  network_interface_names = virtual_machine.value.network_interface_names
                  os_disk_name            = virtual_machine.value.os_disk_name
                  virtual_machine_name    = virtual_machine.value.virtual_machine_name

                  dynamic "data_disk" {
                    for_each = virtual_machine.value.data_disk != null ? virtual_machine.value.data_disk : []
                    content {
                      names       = data_disk.value.names
                      volume_name = data_disk.value.volume_name
                    }
                  }
                }
              }
            }
          }

          dynamic "shared_storage" {
            for_each = resource_names.value.shared_storage != null ? resource_names.value.shared_storage : []
            content {
              account_name          = shared_storage.value.account_name
              private_endpoint_name = shared_storage.value.private_endpoint_name
            }
          }
        }
      }

      dynamic "transport_create_and_mount" {
        for_each = three_tier_configuration.value.transport_create_and_mount != null ? three_tier_configuration.value.transport_create_and_mount : []
        content {
          resource_group_id    = transport_create_and_mount.value.resource_group_id
          storage_account_name = transport_create_and_mount.value.storage_account_name
        }
      }
    }
  }
}
