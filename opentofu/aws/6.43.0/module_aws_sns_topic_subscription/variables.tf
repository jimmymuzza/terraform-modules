variable "sns_topic_subscriptions" {
  description = <<EOT
Map of sns_topic_subscriptions, attributes below
Required:
    - endpoint
    - protocol
    - topic_arn
Optional:
    - confirmation_timeout_in_minutes
    - delivery_policy
    - endpoint_auto_confirms
    - filter_policy
    - filter_policy_scope
    - raw_message_delivery
    - redrive_policy
    - region
    - replay_policy
    - subscription_role_arn
EOT

  type = map(object({
    endpoint                        = string
    protocol                        = string
    topic_arn                       = string
    confirmation_timeout_in_minutes = optional(number)
    delivery_policy                 = optional(string)
    endpoint_auto_confirms          = optional(bool)
    filter_policy                   = optional(string)
    filter_policy_scope             = optional(string)
    raw_message_delivery            = optional(bool)
    redrive_policy                  = optional(string)
    region                          = optional(string)
    replay_policy                   = optional(string)
    subscription_role_arn           = optional(string)
  }))
}
