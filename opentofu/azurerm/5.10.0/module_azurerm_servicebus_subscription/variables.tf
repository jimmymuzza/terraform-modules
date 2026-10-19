variable "servicebus_subscriptions" {
  description = <<EOT
Map of servicebus_subscriptions, attributes below
Required:
    - max_delivery_count
    - name
    - topic_id
Optional:
    - auto_delete_on_idle
    - batched_operations_enabled
    - client_scoped_subscription_enabled
    - dead_lettering_on_filter_evaluation_error
    - dead_lettering_on_message_expiration
    - default_message_ttl
    - forward_dead_lettered_messages_to
    - forward_to
    - lock_duration
    - requires_session
    - status
    - client_scoped_subscription
EOT

  type = map(object({
    max_delivery_count                        = number
    name                                      = string
    topic_id                                  = string
    auto_delete_on_idle                       = optional(string)
    batched_operations_enabled                = optional(bool)
    client_scoped_subscription_enabled        = optional(bool)
    dead_lettering_on_filter_evaluation_error = optional(bool)
    dead_lettering_on_message_expiration      = optional(bool)
    default_message_ttl                       = optional(string)
    forward_dead_lettered_messages_to         = optional(string)
    forward_to                                = optional(string)
    lock_duration                             = optional(string)
    requires_session                          = optional(bool)
    status                                    = optional(string)
    client_scoped_subscription                = optional(list(object({
            client_id                               = optional(string)
            is_client_scoped_subscription_shareable = optional(bool)
        })))
  }))
}
