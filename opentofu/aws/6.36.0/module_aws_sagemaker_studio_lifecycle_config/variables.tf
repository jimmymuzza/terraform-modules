variable "sagemaker_studio_lifecycle_configs" {
  description = <<EOT
Map of sagemaker_studio_lifecycle_configs, attributes below
Required:
    - studio_lifecycle_config_app_type
    - studio_lifecycle_config_content
    - studio_lifecycle_config_name
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    studio_lifecycle_config_app_type = string
    studio_lifecycle_config_content  = string
    studio_lifecycle_config_name     = string
    region                           = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
  }))
}
