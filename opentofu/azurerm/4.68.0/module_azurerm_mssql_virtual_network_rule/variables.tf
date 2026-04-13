variable "mssql_virtual_network_rules" {
  description = <<EOT
Map of mssql_virtual_network_rules, attributes below
Required:
    - name
    - server_id
    - subnet_id
Optional:
    - ignore_missing_vnet_service_endpoint
EOT

  type = map(object({
    name                                 = string
    server_id                            = string
    subnet_id                            = string
    ignore_missing_vnet_service_endpoint = optional(bool)
  }))
}
