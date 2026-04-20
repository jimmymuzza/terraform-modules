variable "consumption_budget_management_groups" {
  description = <<EOT
Map of consumption_budget_management_groups, attributes below
Required:
    - amount
    - management_group_id
    - name
    - notification
    - time_period
Optional:
    - etag
    - time_grain
    - filter
EOT

  type = map(object({
    amount              = number
    management_group_id = string
    name                = string
    etag                = optional(string)
    time_grain          = optional(string)
    filter              = optional(list(object({
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
    notification        = set(object({
            contact_emails = list(string)
            operator       = string
            threshold      = number
            enabled        = optional(bool)
            threshold_type = optional(string)
        }))
    time_period         = list(object({
            start_date = string
            end_date   = optional(string)
        }))
  }))
}
