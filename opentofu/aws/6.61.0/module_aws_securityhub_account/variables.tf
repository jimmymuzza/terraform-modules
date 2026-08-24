variable "securityhub_accounts" {
  description = <<EOT
Map of securityhub_accounts, attributes below
Optional:
    - auto_enable_controls
    - control_finding_generator
    - enable_default_standards
    - region
EOT

  type = map(object({
    auto_enable_controls      = optional(bool)
    control_finding_generator = optional(string)
    enable_default_standards  = optional(bool)
    region                    = optional(string)
  }))
}
