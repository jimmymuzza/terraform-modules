variable "cloudwatch_event_bus_policies" {
  description = <<EOT
Map of cloudwatch_event_bus_policies, attributes below
Required:
    - policy
Optional:
    - event_bus_name
    - region
EOT

  type = map(object({
    policy         = string
    event_bus_name = optional(string)
    region         = optional(string)
  }))
}
