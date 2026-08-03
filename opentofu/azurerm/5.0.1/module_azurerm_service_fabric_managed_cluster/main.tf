resource "azurerm_service_fabric_managed_cluster" "service_fabric_managed_clusters" {
  for_each = var.service_fabric_managed_clusters

  client_connection_port = each.value.client_connection_port
  http_gateway_port      = each.value.http_gateway_port
  location               = each.value.location
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  backup_service_enabled = each.value.backup_service_enabled
  dns_name               = each.value.dns_name
  dns_service_enabled    = each.value.dns_service_enabled
  password               = each.value.password
  sku                    = each.value.sku
  subnet_id              = each.value.subnet_id
  tags                   = each.value.tags
  upgrade_wave           = each.value.upgrade_wave
  username               = each.value.username

  dynamic "authentication" {
    for_each = each.value.authentication != null ? each.value.authentication : []
    content {

      dynamic "active_directory" {
        for_each = authentication.value.active_directory != null ? authentication.value.active_directory : []
        content {
          client_application_id  = active_directory.value.client_application_id
          cluster_application_id = active_directory.value.cluster_application_id
          tenant_id              = active_directory.value.tenant_id
        }
      }

      dynamic "certificate" {
        for_each = authentication.value.certificate != null ? authentication.value.certificate : []
        content {
          thumbprint  = certificate.value.thumbprint
          type        = certificate.value.type
          common_name = certificate.value.common_name
        }
      }
    }
  }

  dynamic "custom_fabric_setting" {
    for_each = each.value.custom_fabric_setting != null ? each.value.custom_fabric_setting : []
    content {
      parameter = custom_fabric_setting.value.parameter
      section   = custom_fabric_setting.value.section
      value     = custom_fabric_setting.value.value
    }
  }

  dynamic "lb_rule" {
    for_each = each.value.lb_rule != null ? each.value.lb_rule : []
    content {
      backend_port       = lb_rule.value.backend_port
      frontend_port      = lb_rule.value.frontend_port
      probe_protocol     = lb_rule.value.probe_protocol
      protocol           = lb_rule.value.protocol
      probe_request_path = lb_rule.value.probe_request_path
    }
  }

  dynamic "node_type" {
    for_each = each.value.node_type != null ? each.value.node_type : []
    content {
      application_port_range            = node_type.value.application_port_range
      data_disk_size_gb                 = node_type.value.data_disk_size_gb
      ephemeral_port_range              = node_type.value.ephemeral_port_range
      name                              = node_type.value.name
      vm_image_offer                    = node_type.value.vm_image_offer
      vm_image_publisher                = node_type.value.vm_image_publisher
      vm_image_sku                      = node_type.value.vm_image_sku
      vm_image_version                  = node_type.value.vm_image_version
      vm_instance_count                 = node_type.value.vm_instance_count
      vm_size                           = node_type.value.vm_size
      capacities                        = node_type.value.capacities
      data_disk_type                    = node_type.value.data_disk_type
      multiple_placement_groups_enabled = node_type.value.multiple_placement_groups_enabled
      placement_properties              = node_type.value.placement_properties
      primary                           = node_type.value.primary
      stateless                         = node_type.value.stateless

      dynamic "vm_secrets" {
        for_each = node_type.value.vm_secrets != null ? node_type.value.vm_secrets : []
        content {
          vault_id = vm_secrets.value.vault_id

          dynamic "certificates" {
            for_each = vm_secrets.value.certificates != null ? vm_secrets.value.certificates : []
            content {
              store = certificates.value.store
              url   = certificates.value.url
            }
          }
        }
      }
    }
  }
}
