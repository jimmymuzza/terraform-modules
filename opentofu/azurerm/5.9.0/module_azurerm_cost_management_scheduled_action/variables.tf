variable "cost_management_scheduled_actions" {
  description = <<EOT
Map of cost_management_scheduled_actions, attributes below
Required:
    - display_name
    - email_address_sender
    - email_addresses
    - email_subject
    - end_date
    - frequency
    - name
    - start_date
    - view_id
Optional:
    - day_of_month
    - days_of_week
    - hour_of_day
    - message
    - weeks_of_month
EOT

  type = map(object({
    display_name         = string
    email_address_sender = string
    email_addresses      = list(string)
    email_subject        = string
    end_date             = string
    frequency            = string
    name                 = string
    start_date           = string
    view_id              = string
    day_of_month         = optional(number)
    days_of_week         = optional(list(string))
    hour_of_day          = optional(number)
    message              = optional(string)
    weeks_of_month       = optional(list(string))
  }))
}
