variable "storage_account_queue_properties" {
  description = <<EOT
Map of storage_account_queue_properties, attributes below
Required:
    - storage_account_id
Optional:
    - cors_rule
    - hour_metrics
    - logging
    - minute_metrics
EOT

  type = map(object({
    storage_account_id = string
    cors_rule          = optional(list(object({
            allowed_headers    = list(string)
            allowed_methods    = list(string)
            allowed_origins    = list(string)
            exposed_headers    = list(string)
            max_age_in_seconds = number
        })))
    hour_metrics       = optional(list(object({
            version               = string
            include_apis          = optional(bool)
            retention_policy_days = optional(number)
        })))
    logging            = optional(list(object({
            delete                = bool
            read                  = bool
            version               = string
            write                 = bool
            retention_policy_days = optional(number)
        })))
    minute_metrics     = optional(list(object({
            version               = string
            include_apis          = optional(bool)
            retention_policy_days = optional(number)
        })))
  }))
}
