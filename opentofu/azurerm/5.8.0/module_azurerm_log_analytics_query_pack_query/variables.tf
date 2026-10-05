variable "log_analytics_query_pack_queries" {
  description = <<EOT
Map of log_analytics_query_pack_queries, attributes below
Required:
    - body
    - display_name
    - query_pack_id
Optional:
    - additional_settings_json
    - categories
    - description
    - name
    - resource_types
    - solutions
    - tags
EOT

  type = map(object({
    body                     = string
    display_name             = string
    query_pack_id            = string
    additional_settings_json = optional(string)
    categories               = optional(list(string))
    description              = optional(string)
    name                     = optional(string)
    resource_types           = optional(list(string))
    solutions                = optional(list(string))
    tags                     = optional(map(string))
  }))
}
