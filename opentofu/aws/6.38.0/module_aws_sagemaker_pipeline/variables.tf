variable "sagemaker_pipelines" {
  description = <<EOT
Map of sagemaker_pipelines, attributes below
Required:
    - pipeline_display_name
    - pipeline_name
Optional:
    - pipeline_definition
    - pipeline_description
    - region
    - role_arn
    - tags
    - tags_all
    - parallelism_configuration
    - pipeline_definition_s3_location
EOT

  type = map(object({
    pipeline_display_name           = string
    pipeline_name                   = string
    pipeline_definition             = optional(string)
    pipeline_description            = optional(string)
    region                          = optional(string)
    role_arn                        = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    parallelism_configuration       = optional(list(object({
            max_parallel_execution_steps = number
        })))
    pipeline_definition_s3_location = optional(list(object({
            bucket     = string
            object_key = string
            version_id = optional(string)
        })))
  }))
}
