variable "dynamodb_table_exports" {
  description = <<EOT
Map of dynamodb_table_exports, attributes below
Required:
    - s3_bucket
    - table_arn
Optional:
    - export_format
    - export_time
    - export_type
    - region
    - s3_bucket_owner
    - s3_prefix
    - s3_sse_algorithm
    - s3_sse_kms_key_id
    - incremental_export_specification
EOT

  type = map(object({
    s3_bucket                        = string
    table_arn                        = string
    export_format                    = optional(string)
    export_time                      = optional(string)
    export_type                      = optional(string)
    region                           = optional(string)
    s3_bucket_owner                  = optional(string)
    s3_prefix                        = optional(string)
    s3_sse_algorithm                 = optional(string)
    s3_sse_kms_key_id                = optional(string)
    incremental_export_specification = optional(list(object({
            export_from_time = optional(string)
            export_to_time   = optional(string)
            export_view_type = optional(string)
        })))
  }))
}
