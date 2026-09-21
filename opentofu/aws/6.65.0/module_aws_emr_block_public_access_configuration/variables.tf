variable "emr_block_public_access_configurations" {
  description = <<EOT
Map of emr_block_public_access_configurations, attributes below
Required:
    - block_public_security_group_rules
Optional:
    - region
    - permitted_public_security_group_rule_range
EOT

  type = map(object({
    block_public_security_group_rules          = bool
    region                                     = optional(string)
    permitted_public_security_group_rule_range = optional(list(object({
            max_range = number
            min_range = number
        })))
  }))
}
