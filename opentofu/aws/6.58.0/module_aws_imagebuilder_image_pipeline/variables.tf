variable "imagebuilder_image_pipelines" {
  description = <<EOT
Map of imagebuilder_image_pipelines, attributes below
Required:
    - infrastructure_configuration_arn
    - name
Optional:
    - container_recipe_arn
    - description
    - distribution_configuration_arn
    - enhanced_image_metadata_enabled
    - execution_role
    - image_recipe_arn
    - region
    - status
    - tags
    - tags_all
    - image_scanning_configuration
    - image_tests_configuration
    - logging_configuration
    - schedule
    - workflow
EOT

  type = map(object({
    infrastructure_configuration_arn = string
    name                             = string
    container_recipe_arn             = optional(string)
    description                      = optional(string)
    distribution_configuration_arn   = optional(string)
    enhanced_image_metadata_enabled  = optional(bool)
    execution_role                   = optional(string)
    image_recipe_arn                 = optional(string)
    region                           = optional(string)
    status                           = optional(string)
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
            image_log_group_name    = optional(string)
            pipeline_log_group_name = optional(string)
        })))
    schedule                         = optional(list(object({
            schedule_expression                = string
            pipeline_execution_start_condition = optional(string)
            timezone                           = optional(string)
        })))
    workflow                         = optional(list(object({
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
