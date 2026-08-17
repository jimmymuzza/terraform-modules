variable "cloudwatch_log_deliveries" {
  description = <<EOT
Map of cloudwatch_log_deliveries, attributes below
Required:
    - delivery_destination_arn
    - delivery_source_name
Optional:
    - field_delimiter
    - record_fields
    - region
    - s3_delivery_configuration
    - tags
EOT

  type = map(object({
    delivery_destination_arn  = string
    delivery_source_name      = string
    field_delimiter           = optional(string)
    record_fields             = optional(list(string))
    region                    = optional(string)
    s3_delivery_configuration = optional(list(object({
            enable_hive_compatible_path = bool
            suffix_path = string
        })))
    tags                      = optional(map(string))
  }))
}
