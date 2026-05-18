variable "eventhubs" {
  description = <<EOT
Map of eventhubs, attributes below
Required:
    - name
    - partition_count
Optional:
    - message_retention
    - namespace_id
    - namespace_name
    - resource_group_name
    - status
    - capture_description
    - retention_description
EOT

  type = map(object({
    name                  = string
    partition_count       = number
    message_retention     = optional(number)
    namespace_id          = optional(string)
    namespace_name        = optional(string)
    resource_group_name   = optional(string)
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
