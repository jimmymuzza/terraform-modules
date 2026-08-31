variable "kusto_clusters" {
  description = <<EOT
Map of kusto_clusters, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - allowed_fqdns
    - allowed_ip_ranges
    - auto_stop_enabled
    - disk_encryption_enabled
    - double_encryption_enabled
    - outbound_network_access_restricted
    - public_ip_type
    - public_network_access_enabled
    - purge_enabled
    - streaming_ingestion_enabled
    - tags
    - trusted_external_tenants
    - zones
    - identity
    - language_extension
    - optimized_auto_scale
EOT

  type = map(object({
    location                           = string
    name                               = string
    resource_group_name                = string
    allowed_fqdns                      = optional(list(string))
    allowed_ip_ranges                  = optional(list(string))
    auto_stop_enabled                  = optional(bool)
    disk_encryption_enabled            = optional(bool)
    double_encryption_enabled          = optional(bool)
    outbound_network_access_restricted = optional(bool)
    public_ip_type                     = optional(string)
    public_network_access_enabled      = optional(bool)
    purge_enabled                      = optional(bool)
    streaming_ingestion_enabled        = optional(bool)
    tags                               = optional(map(string))
    trusted_external_tenants           = optional(list(string))
    zones                              = optional(set(string))
    identity                           = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    language_extension                 = optional(list(object({
            image = string
            name  = string
        })))
    optimized_auto_scale               = optional(list(object({
            maximum_instances = number
            minimum_instances = number
        })))
    sku                                = list(object({
            name     = string
            capacity = optional(number)
        }))
  }))
}
