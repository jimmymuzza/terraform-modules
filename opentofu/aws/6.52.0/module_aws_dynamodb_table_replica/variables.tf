variable "dynamodb_table_replicas" {
  description = <<EOT
Map of dynamodb_table_replicas, attributes below
Required:
    - global_table_arn
Optional:
    - deletion_protection_enabled
    - kms_key_arn
    - point_in_time_recovery
    - region
    - table_class_override
    - tags
    - tags_all
EOT

  type = map(object({
    global_table_arn            = string
    deletion_protection_enabled = optional(bool)
    kms_key_arn                 = optional(string)
    point_in_time_recovery      = optional(bool)
    region                      = optional(string)
    table_class_override        = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
  }))
}
