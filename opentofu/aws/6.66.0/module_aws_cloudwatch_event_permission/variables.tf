variable "cloudwatch_event_permissions" {
  description = <<EOT
Map of cloudwatch_event_permissions, attributes below
Required:
    - principal
    - statement_id
Optional:
    - action
    - event_bus_name
    - region
    - condition
EOT

  type = map(object({
    principal      = string
    statement_id   = string
    action         = optional(string)
    event_bus_name = optional(string)
    region         = optional(string)
    condition      = optional(list(object({
            key   = string
            type  = string
            value = string
        })))
  }))
}
