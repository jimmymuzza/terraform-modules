variable "security_center_assessment_policies" {
  description = <<EOT
Map of security_center_assessment_policies, attributes below
Required:
    - description
    - display_name
Optional:
    - categories
    - implementation_effort
    - remediation_description
    - severity
    - threats
    - user_impact
EOT

  type = map(object({
    description             = string
    display_name            = string
    categories              = optional(set(string))
    implementation_effort   = optional(string)
    remediation_description = optional(string)
    severity                = optional(string)
    threats                 = optional(set(string))
    user_impact             = optional(string)
  }))
}
