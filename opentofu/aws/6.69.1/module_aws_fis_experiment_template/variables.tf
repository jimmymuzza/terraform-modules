variable "fis_experiment_templates" {
  description = <<EOT
Map of fis_experiment_templates, attributes below
Required:
    - description
    - role_arn
    - action
    - stop_condition
Optional:
    - region
    - tags
    - tags_all
    - experiment_options
    - experiment_report_configuration
    - log_configuration
    - target
EOT

  type = map(object({
    description                     = string
    role_arn                        = string
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    action                          = set(object({
            action_id   = string
            name        = string
            description = optional(string)
            start_after = optional(set(string))
            parameter   = optional(set(object({
                key   = string
                value = string
            })))
            target      = optional(list(object({
                key   = string
                value = string
            })))
        }))
    experiment_options              = optional(list(object({
            account_targeting            = optional(string)
            empty_target_resolution_mode = optional(string)
        })))
    experiment_report_configuration = optional(list(object({
            post_experiment_duration = optional(string)
            pre_experiment_duration  = optional(string)
            data_sources             = optional(list(object({
                cloudwatch_dashboard = optional(list(object({
                    dashboard_arn = optional(string)
                })))
            })))
            outputs                  = optional(list(object({
                s3_configuration = optional(list(object({
                    bucket_name = string
                    prefix      = optional(string)
                })))
            })))
        })))
    log_configuration               = optional(list(object({
            log_schema_version            = number
            cloudwatch_logs_configuration = optional(list(object({
                log_group_arn = string
            })))
            s3_configuration              = optional(list(object({
                bucket_name = string
                prefix      = optional(string)
            })))
        })))
    stop_condition                  = set(object({
            source = string
            value  = optional(string)
        }))
    target                          = optional(set(object({
            name           = string
            resource_type  = string
            selection_mode = string
            parameters     = optional(map(string))
            resource_arns  = optional(set(string))
            filter         = optional(list(object({
                path   = string
                values = set(string)
            })))
            resource_tag   = optional(set(object({
                key   = string
                value = string
            })))
        })))
  }))
}
