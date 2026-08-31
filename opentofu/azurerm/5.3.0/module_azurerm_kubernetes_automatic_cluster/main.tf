resource "azurerm_kubernetes_automatic_cluster" "kubernetes_automatic_clusters" {
  for_each = var.kubernetes_automatic_clusters

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "api_server_access" {
    for_each = each.value.api_server_access != null ? each.value.api_server_access : []
    content {
      authorized_ip_ranges = api_server_access.value.authorized_ip_ranges
      subnet_id            = api_server_access.value.subnet_id
    }
  }

  dynamic "hosted_system" {
    for_each = each.value.hosted_system != null ? each.value.hosted_system : []
    content {
      node_subnet_id        = hosted_system.value.node_subnet_id
      system_node_subnet_id = hosted_system.value.system_node_subnet_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "private_cluster" {
    for_each = each.value.private_cluster != null ? each.value.private_cluster : []
    content {
      private_dns_zone_id                        = private_cluster.value.private_dns_zone_id
      public_fully_qualified_domain_name_enabled = private_cluster.value.public_fully_qualified_domain_name_enabled
    }
  }

  dynamic "service_mesh" {
    for_each = each.value.service_mesh != null ? each.value.service_mesh : []
    content {
      revisions                        = service_mesh.value.revisions
      external_ingress_gateway_enabled = service_mesh.value.external_ingress_gateway_enabled
      internal_ingress_gateway_enabled = service_mesh.value.internal_ingress_gateway_enabled
      proxy_redirect_mechanism         = service_mesh.value.proxy_redirect_mechanism

      dynamic "certificate_authority" {
        for_each = service_mesh.value.certificate_authority != null ? service_mesh.value.certificate_authority : []
        content {
          certificate_chain_object_name = certificate_authority.value.certificate_chain_object_name
          certificate_object_name       = certificate_authority.value.certificate_object_name
          key_object_name               = certificate_authority.value.key_object_name
          key_vault_id                  = certificate_authority.value.key_vault_id
          root_certificate_object_name  = certificate_authority.value.root_certificate_object_name
        }
      }
    }
  }

  dynamic "web_app_routing_ingress" {
    for_each = each.value.web_app_routing_ingress != null ? each.value.web_app_routing_ingress : []
    content {
      default_nginx_controller = web_app_routing_ingress.value.default_nginx_controller
      dns_zone_ids             = web_app_routing_ingress.value.dns_zone_ids
      istio_enabled            = web_app_routing_ingress.value.istio_enabled
    }
  }
}
