variable "sagemaker_model_package_groups" {
  description = <<EOT
Map of sagemaker_model_package_groups, attributes below
Required:
    - model_package_group_name
Optional:
    - model_package_group_description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    model_package_group_name        = string
    model_package_group_description = optional(string)
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
  }))
}
