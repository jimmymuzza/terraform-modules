resource "azurerm_hdinsight_interactive_query_cluster" "hdinsight_interactive_query_clusters" {
  for_each = var.hdinsight_interactive_query_clusters

  cluster_version               = each.value.cluster_version
  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  tier                          = each.value.tier
  encryption_in_transit_enabled = each.value.encryption_in_transit_enabled
  tags                          = each.value.tags
  tls_min_version               = each.value.tls_min_version

  dynamic "component_version" {
    for_each = each.value.component_version != null ? each.value.component_version : []
    content {
      interactive_hive = component_version.value.interactive_hive
    }
  }

  dynamic "compute_isolation" {
    for_each = each.value.compute_isolation != null ? each.value.compute_isolation : []
    content {
      compute_isolation_enabled = compute_isolation.value.compute_isolation_enabled
      host_sku                  = compute_isolation.value.host_sku
    }
  }

  dynamic "disk_encryption" {
    for_each = each.value.disk_encryption != null ? each.value.disk_encryption : []
    content {
      encryption_algorithm          = disk_encryption.value.encryption_algorithm
      encryption_at_host_enabled    = disk_encryption.value.encryption_at_host_enabled
      key_vault_key_id              = disk_encryption.value.key_vault_key_id
      key_vault_managed_identity_id = disk_encryption.value.key_vault_managed_identity_id
    }
  }

  dynamic "extension" {
    for_each = each.value.extension != null ? each.value.extension : []
    content {
      log_analytics_workspace_id = extension.value.log_analytics_workspace_id
      primary_key                = extension.value.primary_key
    }
  }

  dynamic "gateway" {
    for_each = each.value.gateway != null ? each.value.gateway : []
    content {
      password = gateway.value.password
      username = gateway.value.username
    }
  }

  dynamic "metastores" {
    for_each = each.value.metastores != null ? each.value.metastores : []
    content {

      dynamic "ambari" {
        for_each = metastores.value.ambari != null ? metastores.value.ambari : []
        content {
          database_name = ambari.value.database_name
          password      = ambari.value.password
          server        = ambari.value.server
          username      = ambari.value.username
        }
      }

      dynamic "hive" {
        for_each = metastores.value.hive != null ? metastores.value.hive : []
        content {
          database_name = hive.value.database_name
          password      = hive.value.password
          server        = hive.value.server
          username      = hive.value.username
        }
      }

      dynamic "oozie" {
        for_each = metastores.value.oozie != null ? metastores.value.oozie : []
        content {
          database_name = oozie.value.database_name
          password      = oozie.value.password
          server        = oozie.value.server
          username      = oozie.value.username
        }
      }
    }
  }

  dynamic "monitor" {
    for_each = each.value.monitor != null ? each.value.monitor : []
    content {
      log_analytics_workspace_id = monitor.value.log_analytics_workspace_id
      primary_key                = monitor.value.primary_key
    }
  }

  dynamic "network" {
    for_each = each.value.network != null ? each.value.network : []
    content {
      connection_direction = network.value.connection_direction
      private_link_enabled = network.value.private_link_enabled
    }
  }

  dynamic "private_link_configuration" {
    for_each = each.value.private_link_configuration != null ? each.value.private_link_configuration : []
    content {
      group_id = private_link_configuration.value.group_id
      name     = private_link_configuration.value.name

      dynamic "ip_configuration" {
        for_each = private_link_configuration.value.ip_configuration != null ? private_link_configuration.value.ip_configuration : []
        content {
          name                         = ip_configuration.value.name
          primary                      = ip_configuration.value.primary
          private_ip_address           = ip_configuration.value.private_ip_address
          private_ip_allocation_method = ip_configuration.value.private_ip_allocation_method
          subnet_id                    = ip_configuration.value.subnet_id
        }
      }
    }
  }

  dynamic "roles" {
    for_each = each.value.roles != null ? each.value.roles : []
    content {

      dynamic "head_node" {
        for_each = roles.value.head_node != null ? roles.value.head_node : []
        content {
          username           = head_node.value.username
          vm_size            = head_node.value.vm_size
          password           = head_node.value.password
          ssh_keys           = head_node.value.ssh_keys
          subnet_id          = head_node.value.subnet_id
          virtual_network_id = head_node.value.virtual_network_id

          dynamic "script_actions" {
            for_each = head_node.value.script_actions != null ? head_node.value.script_actions : []
            content {
              name       = script_actions.value.name
              uri        = script_actions.value.uri
              parameters = script_actions.value.parameters
            }
          }
        }
      }

      dynamic "worker_node" {
        for_each = roles.value.worker_node != null ? roles.value.worker_node : []
        content {
          target_instance_count = worker_node.value.target_instance_count
          username              = worker_node.value.username
          vm_size               = worker_node.value.vm_size
          password              = worker_node.value.password
          ssh_keys              = worker_node.value.ssh_keys
          subnet_id             = worker_node.value.subnet_id
          virtual_network_id    = worker_node.value.virtual_network_id

          dynamic "autoscale" {
            for_each = worker_node.value.autoscale != null ? worker_node.value.autoscale : []
            content {

              dynamic "recurrence" {
                for_each = autoscale.value.recurrence != null ? autoscale.value.recurrence : []
                content {
                  timezone = recurrence.value.timezone

                  dynamic "schedule" {
                    for_each = recurrence.value.schedule != null ? recurrence.value.schedule : []
                    content {
                      days                  = schedule.value.days
                      target_instance_count = schedule.value.target_instance_count
                      time                  = schedule.value.time
                    }
                  }
                }
              }
            }
          }

          dynamic "script_actions" {
            for_each = worker_node.value.script_actions != null ? worker_node.value.script_actions : []
            content {
              name       = script_actions.value.name
              uri        = script_actions.value.uri
              parameters = script_actions.value.parameters
            }
          }
        }
      }

      dynamic "zookeeper_node" {
        for_each = roles.value.zookeeper_node != null ? roles.value.zookeeper_node : []
        content {
          username           = zookeeper_node.value.username
          vm_size            = zookeeper_node.value.vm_size
          password           = zookeeper_node.value.password
          ssh_keys           = zookeeper_node.value.ssh_keys
          subnet_id          = zookeeper_node.value.subnet_id
          virtual_network_id = zookeeper_node.value.virtual_network_id

          dynamic "script_actions" {
            for_each = zookeeper_node.value.script_actions != null ? zookeeper_node.value.script_actions : []
            content {
              name       = script_actions.value.name
              uri        = script_actions.value.uri
              parameters = script_actions.value.parameters
            }
          }
        }
      }
    }
  }

  dynamic "security_profile" {
    for_each = each.value.security_profile != null ? each.value.security_profile : []
    content {
      aadds_resource_id       = security_profile.value.aadds_resource_id
      domain_name             = security_profile.value.domain_name
      domain_user_password    = security_profile.value.domain_user_password
      domain_username         = security_profile.value.domain_username
      ldaps_urls              = security_profile.value.ldaps_urls
      msi_resource_id         = security_profile.value.msi_resource_id
      cluster_users_group_dns = security_profile.value.cluster_users_group_dns
    }
  }

  dynamic "storage_account" {
    for_each = each.value.storage_account != null ? each.value.storage_account : []
    content {
      is_default           = storage_account.value.is_default
      storage_account_key  = storage_account.value.storage_account_key
      storage_container_id = storage_account.value.storage_container_id
      storage_resource_id  = storage_account.value.storage_resource_id
    }
  }

  dynamic "storage_account_gen2" {
    for_each = each.value.storage_account_gen2 != null ? each.value.storage_account_gen2 : []
    content {
      filesystem_id                = storage_account_gen2.value.filesystem_id
      is_default                   = storage_account_gen2.value.is_default
      managed_identity_resource_id = storage_account_gen2.value.managed_identity_resource_id
      storage_resource_id          = storage_account_gen2.value.storage_resource_id
    }
  }
}
