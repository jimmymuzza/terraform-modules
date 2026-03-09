variable "s3tables_tables" {
  description = <<EOT
Map of s3tables_tables, attributes below
Required:
    - format
    - name
    - namespace
    - table_bucket_arn
Optional:
    - encryption_configuration
    - maintenance_configuration
    - region
    - tags
    - metadata
EOT

  type = map(object({
    format                    = string
    name                      = string
    namespace                 = string
    table_bucket_arn          = string
    encryption_configuration  = optional(object({
            kms_key_arn = string
            sse_algorithm = string
        }))
    maintenance_configuration = optional(object({
            iceberg_compaction = object({
                settings = object({
                    target_file_size_mb = number
                })
                status = string
            })
            iceberg_snapshot_management = object({
                settings = object({
                    max_snapshot_age_hours = number
                    min_snapshots_to_keep = number
                })
                status = string
            })
        }))
    region                    = optional(string)
    tags                      = optional(map(string))
    metadata                  = optional(list(object({
            iceberg = optional(list(object({
                schema = optional(list(object({
                    field = optional(list(object({
                        name     = string
                        type     = string
                        required = optional(bool)
                    })))
                })))
            })))
        })))
  }))
}
