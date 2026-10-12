variable "servicebus_subscription_rules" {
  description = <<EOT
Map of servicebus_subscription_rules, attributes below
Required:
    - filter_type
    - name
    - subscription_id
Optional:
    - action
    - sql_filter
    - correlation_filter
EOT

  type = map(object({
    filter_type        = string
    name               = string
    subscription_id    = string
    action             = optional(string)
    sql_filter         = optional(string)
    correlation_filter = optional(list(object({
            content_type        = optional(string)
            correlation_id      = optional(string)
            label               = optional(string)
            message_id          = optional(string)
            properties          = optional(map(string))
            reply_to            = optional(string)
            reply_to_session_id = optional(string)
            session_id          = optional(string)
            to                  = optional(string)
        })))
  }))
}
