variable "cloudwatch_event_targets" {
  description = <<EOT
Map of cloudwatch_event_targets, attributes below
Required:
    - arn
    - rule
Optional:
    - event_bus_name
    - force_destroy
    - input
    - input_path
    - region
    - role_arn
    - target_id
    - appsync_target
    - batch_target
    - dead_letter_config
    - ecs_target
    - http_target
    - input_transformer
    - kinesis_target
    - redshift_target
    - retry_policy
    - run_command_targets
    - sagemaker_pipeline_target
    - sqs_target
EOT

  type = map(object({
    arn                       = string
    rule                      = string
    event_bus_name            = optional(string)
    force_destroy             = optional(bool)
    input                     = optional(string)
    input_path                = optional(string)
    region                    = optional(string)
    role_arn                  = optional(string)
    target_id                 = optional(string)
    appsync_target            = optional(list(object({
            graphql_operation = optional(string)
        })))
    batch_target              = optional(list(object({
            job_definition = string
            job_name       = string
            array_size     = optional(number)
            job_attempts   = optional(number)
        })))
    dead_letter_config        = optional(list(object({
            arn = optional(string)
        })))
    ecs_target                = optional(list(object({
            task_definition_arn        = string
            enable_ecs_managed_tags    = optional(bool)
            enable_execute_command     = optional(bool)
            group                      = optional(string)
            launch_type                = optional(string)
            platform_version           = optional(string)
            propagate_tags             = optional(string)
            tags                       = optional(map(string))
            task_count                 = optional(number)
            capacity_provider_strategy = optional(set(object({
                capacity_provider = string
                base              = optional(number)
                weight            = optional(number)
            })))
            network_configuration      = optional(list(object({
                subnets          = set(string)
                assign_public_ip = optional(bool)
                security_groups  = optional(set(string))
            })))
            ordered_placement_strategy = optional(list(object({
                type  = string
                field = optional(string)
            })))
            placement_constraint       = optional(set(object({
                type       = string
                expression = optional(string)
            })))
        })))
    http_target               = optional(list(object({
            header_parameters       = optional(map(string))
            path_parameter_values   = optional(list(string))
            query_string_parameters = optional(map(string))
        })))
    input_transformer         = optional(list(object({
            input_template = string
            input_paths    = optional(map(string))
        })))
    kinesis_target            = optional(list(object({
            partition_key_path = optional(string)
        })))
    redshift_target           = optional(list(object({
            database            = string
            db_user             = optional(string)
            secrets_manager_arn = optional(string)
            sql                 = optional(string)
            statement_name      = optional(string)
            with_event          = optional(bool)
        })))
    retry_policy              = optional(list(object({
            maximum_event_age_in_seconds = optional(number)
            maximum_retry_attempts       = optional(number)
        })))
    run_command_targets       = optional(list(object({
            key    = string
            values = list(string)
        })))
    sagemaker_pipeline_target = optional(list(object({
            pipeline_parameter_list = optional(set(object({
                name  = string
                value = string
            })))
        })))
    sqs_target                = optional(list(object({
            message_group_id = optional(string)
        })))
  }))
}
