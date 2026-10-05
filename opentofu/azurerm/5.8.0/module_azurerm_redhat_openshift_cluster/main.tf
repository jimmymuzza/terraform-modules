resource "azurerm_redhat_openshift_cluster" "redhat_openshift_clusters" {
  for_each = var.redhat_openshift_clusters

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "api_server_profile" {
    for_each = each.value.api_server_profile != null ? each.value.api_server_profile : []
    content {
      visibility = api_server_profile.value.visibility
    }
  }

  dynamic "cluster_profile" {
    for_each = each.value.cluster_profile != null ? each.value.cluster_profile : []
    content {
      domain                      = cluster_profile.value.domain
      version                     = cluster_profile.value.version
      fips_enabled                = cluster_profile.value.fips_enabled
      managed_resource_group_name = cluster_profile.value.managed_resource_group_name
      pull_secret                 = cluster_profile.value.pull_secret
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "ingress_profile" {
    for_each = each.value.ingress_profile != null ? each.value.ingress_profile : []
    content {
      visibility = ingress_profile.value.visibility
    }
  }

  dynamic "main_profile" {
    for_each = each.value.main_profile != null ? each.value.main_profile : []
    content {
      subnet_id                  = main_profile.value.subnet_id
      vm_size                    = main_profile.value.vm_size
      disk_encryption_set_id     = main_profile.value.disk_encryption_set_id
      encryption_at_host_enabled = main_profile.value.encryption_at_host_enabled
    }
  }

  dynamic "network_profile" {
    for_each = each.value.network_profile != null ? each.value.network_profile : []
    content {
      pod_cidr                                     = network_profile.value.pod_cidr
      service_cidr                                 = network_profile.value.service_cidr
      outbound_type                                = network_profile.value.outbound_type
      preconfigured_network_security_group_enabled = network_profile.value.preconfigured_network_security_group_enabled

      dynamic "load_balancer_profile" {
        for_each = network_profile.value.load_balancer_profile != null ? network_profile.value.load_balancer_profile : []
        content {
          managed_outbound_ip_count = load_balancer_profile.value.managed_outbound_ip_count
        }
      }
    }
  }

  dynamic "platform_workload_identity_profile" {
    for_each = each.value.platform_workload_identity_profile != null ? each.value.platform_workload_identity_profile : []
    content {
      upgradeable_to = platform_workload_identity_profile.value.upgradeable_to

      dynamic "platform_workload_identity" {
        for_each = platform_workload_identity_profile.value.platform_workload_identity != null ? platform_workload_identity_profile.value.platform_workload_identity : []
        content {
          identity_id = platform_workload_identity.value.identity_id
          name        = platform_workload_identity.value.name
        }
      }
    }
  }

  dynamic "service_principal" {
    for_each = each.value.service_principal != null ? each.value.service_principal : []
    content {
      client_id     = service_principal.value.client_id
      client_secret = service_principal.value.client_secret
    }
  }

  dynamic "worker_profile" {
    for_each = each.value.worker_profile != null ? each.value.worker_profile : []
    content {
      disk_size_gb               = worker_profile.value.disk_size_gb
      node_count                 = worker_profile.value.node_count
      subnet_id                  = worker_profile.value.subnet_id
      vm_size                    = worker_profile.value.vm_size
      disk_encryption_set_id     = worker_profile.value.disk_encryption_set_id
      encryption_at_host_enabled = worker_profile.value.encryption_at_host_enabled
    }
  }
}
