variable "imagebuilder_images" {
  description = <<EOT
Map of imagebuilder_images, attributes below
Required:
    - infrastructure_configuration_arn
Optional:
    - container_recipe_arn
    - distribution_configuration_arn
    - enhanced_image_metadata_enabled
    - execution_role
    - image_recipe_arn
    - region
    - tags
    - tags_all
    - image_scanning_configuration
    - image_tests_configuration
    - logging_configuration
    - workflow
EOT

  type = map(object({
    infrastructure_configuration_arn = string
    container_recipe_arn             = optional(string)
    distribution_configuration_arn   = optional(string)
    enhanced_image_metadata_enabled  = optional(bool)
    execution_role                   = optional(string)
    image_recipe_arn                 = optional(string)
    region                           = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    image_scanning_configuration     = optional(list(object({
            image_scanning_enabled = optional(bool)
            ecr_configuration      = optional(list(object({
                container_tags  = optional(set(string))
                repository_name = optional(string)
            })))
        })))
    image_tests_configuration        = optional(list(object({
            image_tests_enabled = optional(bool)
            timeout_minutes     = optional(number)
        })))
    logging_configuration            = optional(list(object({
            log_group_name = string
        })))
    workflow                         = optional(set(object({
            workflow_arn   = string
            on_failure     = optional(string)
            parallel_group = optional(string)
            parameter      = optional(set(object({
                name  = string
                value = string
            })))
        })))
  }))
}
