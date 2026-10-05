variable "sagemaker_flow_definitions" {
  description = <<EOT
Map of sagemaker_flow_definitions, attributes below
Required:
    - flow_definition_name
    - role_arn
    - human_loop_config
    - output_config
Optional:
    - region
    - tags
    - tags_all
    - human_loop_activation_config
    - human_loop_request_source
EOT

  type = map(object({
    flow_definition_name         = string
    role_arn                     = string
    region                       = optional(string)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
    human_loop_activation_config = optional(list(object({
            human_loop_activation_conditions_config = optional(list(object({
                human_loop_activation_conditions = string
            })))
        })))
    human_loop_config            = list(object({
            human_task_ui_arn                     = string
            task_count                            = number
            task_description                      = string
            task_title                            = string
            workteam_arn                          = string
            task_availability_lifetime_in_seconds = optional(number)
            task_keywords                         = optional(set(string))
            task_time_limit_in_seconds            = optional(number)
            public_workforce_task_price           = optional(list(object({
                amount_in_usd = optional(list(object({
                    cents                     = optional(number)
                    dollars                   = optional(number)
                    tenth_fractions_of_a_cent = optional(number)
                })))
            })))
        }))
    human_loop_request_source    = optional(list(object({
            aws_managed_human_loop_request_source = string
        })))
    output_config                = list(object({
            s3_output_path = string
            kms_key_id     = optional(string)
        }))
  }))
}
