variable "timestreamwrite_tables" {
  description = <<EOT
Map of timestreamwrite_tables, attributes below
Required:
    - database_name
    - table_name
Optional:
    - region
    - tags
    - tags_all
    - magnetic_store_write_properties
    - retention_properties
    - schema
EOT

  type = map(object({
    database_name                   = string
    table_name                      = string
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    magnetic_store_write_properties = optional(list(object({
            enable_magnetic_store_writes          = optional(bool)
            magnetic_store_rejected_data_location = optional(list(object({
                s3_configuration = optional(list(object({
                    bucket_name       = optional(string)
                    encryption_option = optional(string)
                    kms_key_id        = optional(string)
                    object_key_prefix = optional(string)
                })))
            })))
        })))
    retention_properties            = optional(list(object({
            magnetic_store_retention_period_in_days = number
            memory_store_retention_period_in_hours  = number
        })))
    schema                          = optional(list(object({
            composite_partition_key = optional(list(object({
                type                  = string
                enforcement_in_record = optional(string)
                name                  = optional(string)
            })))
        })))
  }))
}
