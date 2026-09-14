variable "signer_signing_profile_permissions" {
  description = <<EOT
Map of signer_signing_profile_permissions, attributes below
Required:
    - action
    - principal
    - profile_name
Optional:
    - profile_version
    - region
    - statement_id
    - statement_id_prefix
EOT

  type = map(object({
    action              = string
    principal           = string
    profile_name        = string
    profile_version     = optional(string)
    region              = optional(string)
    statement_id        = optional(string)
    statement_id_prefix = optional(string)
  }))
}
