variable "kusto_databases" {
  description = <<EOT
Map of kusto_databases, attributes below
Required:
    - cluster_name
    - location
    - name
    - resource_group_name
Optional:
    - hot_cache_period
    - soft_delete_period
EOT

  type = map(object({
    cluster_name        = string
    location            = string
    name                = string
    resource_group_name = string
    hot_cache_period    = optional(string)
    soft_delete_period  = optional(string)
  }))
}
