variable "s3tables_table_buckets" {
  description = <<EOT
Map of s3tables_table_buckets, attributes below
Required:
    - name
Optional:
    - encryption_configuration
    - force_destroy
    - maintenance_configuration
    - region
    - tags
EOT

  type = map(object({
    name                      = string
    encryption_configuration  = optional(object({
            kms_key_arn = string
            sse_algorithm = string
        }))
    force_destroy             = optional(bool)
    maintenance_configuration = optional(object({
            iceberg_unreferenced_file_removal = object({
                settings = object({
                    non_current_days = number
                    unreferenced_days = number
                })
                status = string
            })
        }))
    region                    = optional(string)
    tags                      = optional(map(string))
  }))
}
