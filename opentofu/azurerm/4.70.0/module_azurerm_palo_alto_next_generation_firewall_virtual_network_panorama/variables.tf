variable "palo_alto_next_generation_firewall_virtual_network_panoramas" {
  description = <<EOT
Map of palo_alto_next_generation_firewall_virtual_network_panoramas, attributes below
Required:
    - location
    - name
    - panorama_base64_config
    - resource_group_name
    - network_profile
Optional:
    - marketplace_offer_id
    - plan_id
    - tags
    - destination_nat
    - dns_settings
EOT

  type = map(object({
    location               = string
    name                   = string
    panorama_base64_config = string
    resource_group_name    = string
    marketplace_offer_id   = optional(string)
    plan_id                = optional(string)
    tags                   = optional(map(string))
    destination_nat        = optional(list(object({
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
    dns_settings           = optional(list(object({
            dns_servers   = optional(list(string))
            use_azure_dns = optional(bool)
        })))
    network_profile        = list(object({
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
