variable "notification_hub_namespaces" {
  description = <<EOT
Map of notification_hub_namespaces, attributes below
Required:
    - location
    - name
    - namespace_type
    - resource_group_name
    - sku_name
Optional:
    - enabled
    - replication_region
    - tags
    - zone_redundancy_enabled
EOT

  type = map(object({
    location                = string
    name                    = string
    namespace_type          = string
    resource_group_name     = string
    sku_name                = string
    enabled                 = optional(bool)
    replication_region      = optional(string)
    tags                    = optional(map(string))
    zone_redundancy_enabled = optional(bool)
  }))
}
