variable "express_route_ports" {
  description = <<EOT
Map of express_route_ports, attributes below
Required:
    - bandwidth_in_gbps
    - encapsulation
    - location
    - name
    - peering_location
    - resource_group_name
Optional:
    - billing_type
    - tags
    - identity
    - link1
    - link2
EOT

  type = map(object({
    bandwidth_in_gbps   = number
    encapsulation       = string
    location            = string
    name                = string
    peering_location    = string
    resource_group_name = string
    billing_type        = optional(string)
    tags                = optional(map(string))
    identity            = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    link1               = optional(list(object({
            admin_enabled                 = optional(bool)
            macsec_cak_keyvault_secret_id = optional(string)
            macsec_cipher                 = optional(string)
            macsec_ckn_keyvault_secret_id = optional(string)
            macsec_sci_enabled            = optional(bool)
        })))
    link2               = optional(list(object({
            admin_enabled                 = optional(bool)
            macsec_cak_keyvault_secret_id = optional(string)
            macsec_cipher                 = optional(string)
            macsec_ckn_keyvault_secret_id = optional(string)
            macsec_sci_enabled            = optional(bool)
        })))
  }))
}
