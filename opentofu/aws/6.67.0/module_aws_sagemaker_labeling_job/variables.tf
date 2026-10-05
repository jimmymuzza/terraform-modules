variable "sagemaker_labeling_jobs" {
  description = <<EOT
Map of sagemaker_labeling_jobs, attributes below
Required:
    - label_attribute_name
    - labeling_job_name
    - role_arn
Optional:
    - label_category_config_s3_uri
    - region
    - stopping_conditions
    - tags
    - human_task_config
    - input_config
    - labeling_job_algorithms_config
    - output_config
EOT

  type = map(object({
    label_attribute_name           = string
    labeling_job_name              = string
    role_arn                       = string
    label_category_config_s3_uri   = optional(string)
    region                         = optional(string)
    stopping_conditions            = optional(list(object({
            max_human_labeled_object_count = number
            max_percentage_of_input_dataset_labeled = number
        })))
    tags                           = optional(map(string))
    human_task_config              = optional(list(object({
            number_of_human_workers_per_data_object = number
            task_description                        = string
            task_time_limit_in_seconds              = number
            task_title                              = string
            workteam_arn                            = string
            max_concurrent_task_count               = optional(number)
            pre_human_task_lambda_arn               = optional(string)
            task_availability_lifetime_in_seconds   = optional(number)
            task_keywords                           = optional(set(string))
            annotation_consolidation_config         = optional(list(object({
                annotation_consolidation_lambda_arn = string
            })))
            public_workforce_task_price             = optional(list(object({
                amount_in_usd = optional(list(object({
                    cents                     = optional(number)
                    dollars                   = optional(number)
                    tenth_fractions_of_a_cent = optional(number)
                })))
            })))
            ui_config                               = optional(list(object({
                human_task_ui_arn  = optional(string)
                ui_template_s3_uri = optional(string)
            })))
        })))
    input_config                   = optional(list(object({
            data_attributes = optional(list(object({
                content_classifiers = optional(set(string))
            })))
            data_source     = optional(list(object({
                s3_data_source  = optional(list(object({
                    manifest_s3_uri = string
                })))
                sns_data_source = optional(list(object({
                    sns_topic_arn = string
                })))
            })))
        })))
    labeling_job_algorithms_config = optional(list(object({
            labeling_job_algorithm_specification_arn = string
            initial_active_learning_model_arn        = optional(string)
            labeling_job_resource_config             = optional(list(object({
                volume_kms_key_id = optional(string)
                vpc_config        = optional(list(object({
                    security_group_ids = set(string)
                    subnets            = set(string)
                })))
            })))
        })))
    output_config                  = optional(list(object({
            s3_output_path = string
            kms_key_id     = optional(string)
            sns_topic_arn  = optional(string)
        })))
  }))
}
