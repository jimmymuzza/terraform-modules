variable "servicebus_topics" {
  description = <<EOT
Map of servicebus_topics, attributes below
Required:
    - name
    - namespace_id
Optional:
    - auto_delete_on_idle
    - batched_operations_enabled
    - default_message_ttl
    - duplicate_detection_history_time_window
    - express_enabled
    - max_message_size_in_kilobytes
    - max_size_in_megabytes
    - partitioning_enabled
    - requires_duplicate_detection
    - status
    - support_ordering
EOT

  type = map(object({
    name                                    = string
    namespace_id                            = string
    auto_delete_on_idle                     = optional(string)
    batched_operations_enabled              = optional(bool)
    default_message_ttl                     = optional(string)
    duplicate_detection_history_time_window = optional(string)
    express_enabled                         = optional(bool)
    max_message_size_in_kilobytes           = optional(number)
    max_size_in_megabytes                   = optional(number)
    partitioning_enabled                    = optional(bool)
    requires_duplicate_detection            = optional(bool)
    status                                  = optional(string)
    support_ordering                        = optional(bool)
  }))
}
