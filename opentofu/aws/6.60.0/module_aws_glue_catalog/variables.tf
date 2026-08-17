variable "glue_catalogs" {
  description = <<EOT
Map of glue_catalogs, attributes below
Required:
    - name
Optional:
    - allow_full_table_external_data_access
    - description
    - overwrite_child_resource_permissions_with_default
    - parameters
    - region
    - tags
    - catalog_properties
    - create_database_default_permissions
    - create_table_default_permissions
    - federated_catalog
    - target_redshift_catalog
EOT

  type = map(object({
    name                                              = string
    allow_full_table_external_data_access             = optional(string)
    description                                       = optional(string)
    overwrite_child_resource_permissions_with_default = optional(string)
    parameters                                        = optional(map(string))
    region                                            = optional(string)
    tags                                              = optional(map(string))
    catalog_properties                                = optional(list(object({
            custom_properties               = optional(map(string))
            data_lake_access_properties     = optional(list(object({
                catalog_type       = optional(string)
                data_lake_access   = optional(bool)
                data_transfer_role = optional(string)
                kms_key            = optional(string)
            })))
            iceberg_optimization_properties = optional(list(object({
                compaction           = optional(map(string))
                orphan_file_deletion = optional(map(string))
                retention            = optional(map(string))
                role_arn             = optional(string)
            })))
        })))
    create_database_default_permissions               = optional(list(object({
            permissions = optional(list(string))
            principal   = optional(list(object({
                data_lake_principal_identifier = optional(string)
            })))
        })))
    create_table_default_permissions                  = optional(list(object({
            permissions = optional(list(string))
            principal   = optional(list(object({
                data_lake_principal_identifier = optional(string)
            })))
        })))
    federated_catalog                                 = optional(list(object({
            connection_name = optional(string)
            connection_type = optional(string)
            identifier      = optional(string)
        })))
    target_redshift_catalog                           = optional(list(object({
            catalog_arn = string
        })))
  }))
}
