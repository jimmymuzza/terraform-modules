variable "vpn_server_configuration_policy_groups" {
  description = <<EOT
Map of vpn_server_configuration_policy_groups, attributes below
Required:
    - name
    - vpn_server_configuration_id
    - policy
Optional:
    - is_default
    - priority
EOT

  type = map(object({
    name                        = string
    vpn_server_configuration_id = string
    is_default                  = optional(bool)
    priority                    = optional(number)
    policy                      = set(object({
            name  = string
            type  = string
            value = string
        }))
  }))
}
