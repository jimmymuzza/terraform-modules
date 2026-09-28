variable "dynatrace_monitors" {
  description = <<EOT
Map of dynatrace_monitors, attributes below
Required:
    - location
    - marketplace_subscription
    - name
    - resource_group_name
    - identity
    - plan
    - user
Optional:
    - monitoring_enabled
    - tags
    - environment_properties
EOT

  type = map(object({
    location                 = string
    marketplace_subscription = string
    name                     = string
    resource_group_name      = string
    monitoring_enabled       = optional(bool)
    tags                     = optional(map(string))
    environment_properties   = optional(list(object({
            environment_info = list(object({
                environment_id = string
            }))
        })))
    identity                 = list(object({
            type = string
        }))
    plan                     = list(object({
            plan          = string
            billing_cycle = optional(string)
            usage_type    = optional(string)
        }))
    user                     = list(object({
            email        = string
            first_name   = string
            last_name    = string
            country      = optional(string)
            phone_number = optional(string)
        }))
  }))
}
