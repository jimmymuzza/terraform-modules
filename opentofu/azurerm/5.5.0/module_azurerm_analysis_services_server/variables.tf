variable "analysis_services_servers" {
  description = <<EOT
Map of analysis_services_servers, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - admin_users
    - backup_blob_container_uri
    - power_bi_service_enabled
    - querypool_connection_mode
    - tags
    - ipv4_firewall_rule
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    sku                       = string
    admin_users               = optional(set(string))
    backup_blob_container_uri = optional(string)
    power_bi_service_enabled  = optional(bool)
    querypool_connection_mode = optional(string)
    tags                      = optional(map(string))
    ipv4_firewall_rule        = optional(set(object({
            name        = string
            range_end   = string
            range_start = string
        })))
  }))
}
