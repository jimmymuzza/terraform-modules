variable "auditmanager_assessment_delegations" {
  description = <<EOT
Map of auditmanager_assessment_delegations, attributes below
Required:
    - assessment_id
    - control_set_id
    - role_arn
    - role_type
Optional:
    - comment
    - region
EOT

  type = map(object({
    assessment_id  = string
    control_set_id = string
    role_arn       = string
    role_type      = string
    comment        = optional(string)
    region         = optional(string)
  }))
}
