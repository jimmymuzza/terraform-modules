variable "palo_alto_next_generation_firewall_virtual_network_strata_cloud_managers" {
  description = <<EOT
Map of palo_alto_next_generation_firewall_virtual_network_strata_cloud_managers, attributes below
Required:
    - location
    - name
    - resource_group_name
    - strata_cloud_manager_tenant_name
    - network_profile
Optional:
    - marketplace_offer_id
    - plan_id
    - tags
    - destination_nat
    - dns_settings
    - identity
EOT

  type = map(object({
    location                         = string
    name                             = string
    resource_group_name              = string
    strata_cloud_manager_tenant_name = string
    marketplace_offer_id             = optional(string)
    plan_id                          = optional(string)
    tags                             = optional(map(string))
    destination_nat                  = optional(list(object({
            name            = string
            protocol        = string
            backend_config  = optional(list(object({
                port              = number
                public_ip_address = string
            })))
            frontend_config = optional(list(object({
                port                 = number
                public_ip_address_id = string
            })))
        })))
    dns_settings                     = optional(list(object({
            dns_servers   = optional(list(string))
            use_azure_dns = optional(bool)
        })))
    identity                         = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
    network_profile                  = list(object({
            public_ip_address_ids     = list(string)
            egress_nat_ip_address_ids = optional(list(string))
            trusted_address_ranges    = optional(list(string))
            vnet_configuration        = list(object({
                virtual_network_id  = string
                trusted_subnet_id   = optional(string)
                untrusted_subnet_id = optional(string)
            }))
        }))
  }))
}
