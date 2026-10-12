variable "emr_studio_session_mappings" {
  description = <<EOT
Map of emr_studio_session_mappings, attributes below
Required:
    - identity_type
    - session_policy_arn
    - studio_id
Optional:
    - identity_id
    - identity_name
    - region
EOT

  type = map(object({
    identity_type      = string
    session_policy_arn = string
    studio_id          = string
    identity_id        = optional(string)
    identity_name      = optional(string)
    region             = optional(string)
  }))
}
