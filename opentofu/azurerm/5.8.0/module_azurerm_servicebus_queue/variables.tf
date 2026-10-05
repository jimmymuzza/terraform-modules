variable "servicebus_queues" {
  description = <<EOT
Map of servicebus_queues, attributes below
Required:
    - name
    - namespace_id
Optional:
    - auto_delete_on_idle
    - batched_operations_enabled
    - dead_lettering_on_message_expiration
    - default_message_ttl
    - duplicate_detection_history_time_window
    - express_enabled
    - forward_dead_lettered_messages_to
    - forward_to
    - lock_duration
    - max_delivery_count
    - max_message_size_in_kilobytes
    - max_size_in_megabytes
    - partitioning_enabled
    - requires_duplicate_detection
    - requires_session
    - status
EOT

  type = map(object({
    name                                    = string
    namespace_id                            = string
    auto_delete_on_idle                     = optional(string)
    batched_operations_enabled              = optional(bool)
    dead_lettering_on_message_expiration    = optional(bool)
    default_message_ttl                     = optional(string)
    duplicate_detection_history_time_window = optional(string)
    express_enabled                         = optional(bool)
    forward_dead_lettered_messages_to       = optional(string)
    forward_to                              = optional(string)
    lock_duration                           = optional(string)
    max_delivery_count                      = optional(number)
    max_message_size_in_kilobytes           = optional(number)
    max_size_in_megabytes                   = optional(number)
    partitioning_enabled                    = optional(bool)
    requires_duplicate_detection            = optional(bool)
    requires_session                        = optional(bool)
    status                                  = optional(string)
  }))
}
