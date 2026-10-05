variable "kusto_attached_database_configurations" {
  description = <<EOT
Map of kusto_attached_database_configurations, attributes below
Required:
    - cluster_id
    - cluster_name
    - database_name
    - location
    - name
    - resource_group_name
Optional:
    - database_name_override
    - database_name_prefix
    - default_principal_modification_kind
    - sharing
EOT

  type = map(object({
    cluster_id                          = string
    cluster_name                        = string
    database_name                       = string
    location                            = string
    name                                = string
    resource_group_name                 = string
    database_name_override              = optional(string)
    database_name_prefix                = optional(string)
    default_principal_modification_kind = optional(string)
    sharing                             = optional(list(object({
            external_tables_to_exclude    = optional(set(string))
            external_tables_to_include    = optional(set(string))
            functions_to_exclude          = optional(set(string))
            functions_to_include          = optional(set(string))
            materialized_views_to_exclude = optional(set(string))
            materialized_views_to_include = optional(set(string))
            tables_to_exclude             = optional(set(string))
            tables_to_include             = optional(set(string))
        })))
  }))
}
