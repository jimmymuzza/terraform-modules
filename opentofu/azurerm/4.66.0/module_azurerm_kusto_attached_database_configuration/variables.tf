variable "kusto_attached_database_configurations" {
  description = <<EOT
Map of kusto_attached_database_configurations, attributes below
Required:
    - cluster_name
    - database_name
    - location
    - name
    - resource_group_name
Optional:
    - cluster_id
    - cluster_resource_id
    - default_principal_modification_kind
    - sharing
EOT

  type = map(object({
    cluster_name                        = string
    database_name                       = string
    location                            = string
    name                                = string
    resource_group_name                 = string
    cluster_id                          = optional(string)
    cluster_resource_id                 = optional(string)
    default_principal_modification_kind = optional(string)
    sharing                             = optional(list(object({
            external_tables_to_exclude    = optional(set(string))
            external_tables_to_include    = optional(set(string))
            materialized_views_to_exclude = optional(set(string))
            materialized_views_to_include = optional(set(string))
            tables_to_exclude             = optional(set(string))
            tables_to_include             = optional(set(string))
        })))
  }))
}
