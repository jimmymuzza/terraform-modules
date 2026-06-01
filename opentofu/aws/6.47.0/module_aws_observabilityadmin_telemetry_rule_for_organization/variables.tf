variable "observabilityadmin_telemetry_rule_for_organizations" {
  description = <<EOT
Map of observabilityadmin_telemetry_rule_for_organizations, attributes below
Required:
    - rule_name
Optional:
    - region
    - tags
    - rule
EOT

  type = map(object({
    rule_name = string
    region    = optional(string)
    tags      = optional(map(string))
    rule      = optional(list(object({
            telemetry_type = string
            resource_type  = optional(string)
        })))
  }))
}
