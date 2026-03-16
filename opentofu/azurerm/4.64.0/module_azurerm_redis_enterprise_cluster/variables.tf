variable "redis_enterprise_clusters" {
  description = <<EOT
Map of redis_enterprise_clusters, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - minimum_tls_version
    - tags
    - zones
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    sku_name            = string
    minimum_tls_version = optional(string)
    tags                = optional(map(string))
    zones               = optional(set(string))
  }))
}
