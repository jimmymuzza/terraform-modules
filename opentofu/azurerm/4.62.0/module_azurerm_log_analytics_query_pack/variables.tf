variable "log_analytics_query_packs" {
  description = <<EOT
Map of log_analytics_query_packs, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}
