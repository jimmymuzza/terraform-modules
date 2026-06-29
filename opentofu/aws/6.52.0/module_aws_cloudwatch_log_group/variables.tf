variable "cloudwatch_log_groups" {
  description = <<EOT
Map of cloudwatch_log_groups, attributes below
Optional:
    - deletion_protection_enabled
    - kms_key_id
    - log_group_class
    - name
    - name_prefix
    - region
    - retention_in_days
    - skip_destroy
    - tags
    - tags_all
EOT

  type = map(object({
    deletion_protection_enabled = optional(bool)
    kms_key_id                  = optional(string)
    log_group_class             = optional(string)
    name                        = optional(string)
    name_prefix                 = optional(string)
    region                      = optional(string)
    retention_in_days           = optional(number)
    skip_destroy                = optional(bool)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
  }))
}
