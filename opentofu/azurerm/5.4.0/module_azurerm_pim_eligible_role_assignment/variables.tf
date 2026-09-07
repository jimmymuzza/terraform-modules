variable "pim_eligible_role_assignments" {
  description = <<EOT
Map of pim_eligible_role_assignments, attributes below
Required:
    - principal_id
    - role_definition_id
    - scope
Optional:
    - condition
    - condition_version
    - justification
    - schedule
    - ticket
EOT

  type = map(object({
    principal_id       = string
    role_definition_id = string
    scope              = string
    condition          = optional(string)
    condition_version  = optional(string)
    justification      = optional(string)
    schedule           = optional(list(object({
            start_date_time = optional(string)
            expiration      = optional(list(object({
                duration_days  = optional(number)
                duration_hours = optional(number)
                end_date_time  = optional(string)
            })))
        })))
    ticket             = optional(list(object({
            number = optional(string)
            system = optional(string)
        })))
  }))
}
