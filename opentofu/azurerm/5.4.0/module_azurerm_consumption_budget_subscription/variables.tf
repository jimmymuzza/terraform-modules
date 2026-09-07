variable "consumption_budget_subscriptions" {
  description = <<EOT
Map of consumption_budget_subscriptions, attributes below
Required:
    - amount
    - name
    - subscription_id
    - notification
    - time_period
Optional:
    - etag
    - time_grain
    - filter
EOT

  type = map(object({
    amount          = number
    name            = string
    subscription_id = string
    etag            = optional(string)
    time_grain      = optional(string)
    filter          = optional(list(object({
            dimension = optional(set(object({
                name     = string
                values   = list(string)
                operator = optional(string)
            })))
            tag       = optional(set(object({
                name     = string
                values   = list(string)
                operator = optional(string)
            })))
        })))
    notification    = set(object({
            operator       = string
            threshold      = number
            contact_emails = optional(list(string))
            contact_groups = optional(list(string))
            contact_roles  = optional(list(string))
            enabled        = optional(bool)
            threshold_type = optional(string)
        }))
    time_period     = list(object({
            start_date = string
            end_date   = optional(string)
        }))
  }))
}
