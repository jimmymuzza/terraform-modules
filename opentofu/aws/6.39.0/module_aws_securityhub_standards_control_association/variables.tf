variable "securityhub_standards_control_associations" {
  description = <<EOT
Map of securityhub_standards_control_associations, attributes below
Required:
    - association_status
    - security_control_id
    - standards_arn
Optional:
    - region
    - updated_reason
EOT

  type = map(object({
    association_status  = string
    security_control_id = string
    standards_arn       = string
    region              = optional(string)
    updated_reason      = optional(string)
  }))
}
