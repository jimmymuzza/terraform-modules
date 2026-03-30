variable "securityhub_configuration_policy_associations" {
  description = <<EOT
Map of securityhub_configuration_policy_associations, attributes below
Required:
    - policy_id
    - target_id
Optional:
    - region
EOT

  type = map(object({
    policy_id = string
    target_id = string
    region    = optional(string)
  }))
}
