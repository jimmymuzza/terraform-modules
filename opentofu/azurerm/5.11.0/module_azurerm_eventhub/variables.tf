variable "eventhubs" {
  description = <<EOT
Map of eventhubs, attributes below
Required:
    - name
    - namespace_id
    - partition_count
Optional:
    - message_retention
    - status
    - capture_description
    - retention_description
EOT

  type = map(object({
    name                  = string
    namespace_id          = string
    partition_count       = number
    message_retention     = optional(number)
    status                = optional(string)
    capture_description   = optional(list(object({
            enabled             = bool
            encoding            = string
            interval_in_seconds = optional(number)
            size_limit_in_bytes = optional(number)
            skip_empty_archives = optional(bool)
            destination         = list(object({
                archive_name_format         = string
                blob_container_name         = string
                name                        = string
                storage_account_id          = string
                storage_authentication_id   = optional(string)
                storage_authentication_type = optional(string)
            }))
        })))
    retention_description = optional(list(object({
            cleanup_policy                    = string
            retention_time_in_hours           = optional(number)
            tombstone_retention_time_in_hours = optional(number)
        })))
  }))
}
