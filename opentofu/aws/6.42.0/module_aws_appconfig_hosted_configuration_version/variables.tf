variable "appconfig_hosted_configuration_versions" {
  description = <<EOT
Map of appconfig_hosted_configuration_versions, attributes below
Required:
    - application_id
    - configuration_profile_id
    - content
    - content_type
Optional:
    - description
    - region
EOT

  type = map(object({
    application_id           = string
    configuration_profile_id = string
    content                  = string
    content_type             = string
    description              = optional(string)
    region                   = optional(string)
  }))
}
