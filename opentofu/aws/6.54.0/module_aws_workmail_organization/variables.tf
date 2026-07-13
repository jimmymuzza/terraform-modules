variable "workmail_organizations" {
  description = <<EOT
Map of workmail_organizations, attributes below
Required:
    - organization_alias
Optional:
    - delete_directory
    - delete_identity_center_application
    - directory_id
    - interoperability_enabled
    - kms_key_arn
    - region
    - tags
EOT

  type = map(object({
    organization_alias                 = string
    delete_directory                   = optional(bool)
    delete_identity_center_application = optional(bool)
    directory_id                       = optional(string)
    interoperability_enabled           = optional(bool)
    kms_key_arn                        = optional(string)
    region                             = optional(string)
    tags                               = optional(map(string))
  }))
}
