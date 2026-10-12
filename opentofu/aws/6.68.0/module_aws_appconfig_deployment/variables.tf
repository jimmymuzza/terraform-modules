variable "appconfig_deployments" {
  description = <<EOT
Map of appconfig_deployments, attributes below
Required:
    - application_id
    - configuration_profile_id
    - configuration_version
    - deployment_strategy_id
    - environment_id
Optional:
    - description
    - kms_key_identifier
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    application_id           = string
    configuration_profile_id = string
    configuration_version    = string
    deployment_strategy_id   = string
    environment_id           = string
    description              = optional(string)
    kms_key_identifier       = optional(string)
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
  }))
}
