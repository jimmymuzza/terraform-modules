variable "appconfig_configuration_profiles" {
  description = <<EOT
Map of appconfig_configuration_profiles, attributes below
Required:
    - application_id
    - location_uri
    - name
Optional:
    - description
    - kms_key_identifier
    - region
    - retrieval_role_arn
    - tags
    - tags_all
    - type
    - validator
EOT

  type = map(object({
    application_id     = string
    location_uri       = string
    name               = string
    description        = optional(string)
    kms_key_identifier = optional(string)
    region             = optional(string)
    retrieval_role_arn = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    type               = optional(string)
    validator          = optional(set(object({
            type    = string
            content = optional(string)
        })))
  }))
}
