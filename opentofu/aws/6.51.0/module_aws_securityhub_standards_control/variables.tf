variable "securityhub_standards_controls" {
  description = <<EOT
Map of securityhub_standards_controls, attributes below
Required:
    - control_status
    - standards_control_arn
Optional:
    - disabled_reason
    - region
EOT

  type = map(object({
    control_status        = string
    standards_control_arn = string
    disabled_reason       = optional(string)
    region                = optional(string)
  }))
}
