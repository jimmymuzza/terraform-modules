variable "kubernetes_automatic_clusters" {
  description = <<EOT
Map of kubernetes_automatic_clusters, attributes below
Required:
    - location
    - name
    - resource_group_name
    - identity
Optional:
    - tags
    - api_server_access
    - hosted_system
    - private_cluster
    - service_mesh
    - web_app_routing_ingress
EOT

  type = map(object({
    location                = string
    name                    = string
    resource_group_name     = string
    tags                    = optional(map(string))
    api_server_access       = optional(list(object({
            authorized_ip_ranges = optional(set(string))
            subnet_id            = optional(string)
        })))
    hosted_system           = optional(list(object({
            node_subnet_id        = string
            system_node_subnet_id = string
        })))
    identity                = list(object({
            type         = string
            identity_ids = optional(set(string))
        }))
    private_cluster         = optional(list(object({
            private_dns_zone_id                        = optional(string)
            public_fully_qualified_domain_name_enabled = optional(bool)
        })))
    service_mesh            = optional(list(object({
            revisions                        = list(string)
            external_ingress_gateway_enabled = optional(bool)
            internal_ingress_gateway_enabled = optional(bool)
            proxy_redirect_mechanism         = optional(string)
            certificate_authority            = optional(list(object({
                certificate_chain_object_name = string
                certificate_object_name       = string
                key_object_name               = string
                key_vault_id                  = string
                root_certificate_object_name  = string
            })))
        })))
    web_app_routing_ingress = optional(list(object({
            default_nginx_controller = optional(string)
            dns_zone_ids             = optional(list(string))
            istio_enabled            = optional(bool)
        })))
  }))
}
