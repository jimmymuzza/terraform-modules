variable "sagemaker_apps" {
  description = <<EOT
Map of sagemaker_apps, attributes below
Required:
    - app_name
    - app_type
    - domain_id
Optional:
    - region
    - space_name
    - tags
    - tags_all
    - user_profile_name
    - resource_spec
EOT

  type = map(object({
    app_name          = string
    app_type          = string
    domain_id         = string
    region            = optional(string)
    space_name        = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    user_profile_name = optional(string)
    resource_spec     = optional(list(object({
            instance_type                 = optional(string)
            lifecycle_config_arn          = optional(string)
            sagemaker_image_arn           = optional(string)
            sagemaker_image_version_alias = optional(string)
            sagemaker_image_version_arn   = optional(string)
        })))
  }))
}
