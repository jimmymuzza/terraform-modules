variable "postgresql_virtual_network_rules" {
  description = <<EOT
Map of postgresql_virtual_network_rules, attributes below
Required:
    - name
    - resource_group_name
    - server_name
    - subnet_id
Optional:
    - ignore_missing_vnet_service_endpoint
EOT

  type = map(object({
    name                                 = string
    resource_group_name                  = string
    server_name                          = string
    subnet_id                            = string
    ignore_missing_vnet_service_endpoint = optional(bool)
  }))
}
