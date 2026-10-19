variable "vpn_gateway_nat_rules" {
  description = <<EOT
Map of vpn_gateway_nat_rules, attributes below
Required:
    - name
    - vpn_gateway_id
Optional:
    - ip_configuration_id
    - mode
    - type
    - external_mapping
    - internal_mapping
EOT

  type = map(object({
    name                = string
    vpn_gateway_id      = string
    ip_configuration_id = optional(string)
    mode                = optional(string)
    type                = optional(string)
    external_mapping    = optional(list(object({
            address_space = string
            port_range    = optional(string)
        })))
    internal_mapping    = optional(list(object({
            address_space = string
            port_range    = optional(string)
        })))
  }))
}
