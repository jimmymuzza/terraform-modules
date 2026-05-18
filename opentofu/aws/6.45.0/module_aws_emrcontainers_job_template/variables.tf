variable "emrcontainers_job_templates" {
  description = <<EOT
Map of emrcontainers_job_templates, attributes below
Required:
    - name
    - job_template_data
Optional:
    - kms_key_arn
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name              = string
    kms_key_arn       = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    job_template_data = list(object({
            execution_role_arn      = string
            release_label           = string
            job_tags                = optional(map(string))
            configuration_overrides = optional(list(object({
                application_configuration = optional(list(object({
                    classification = string
                    properties     = optional(map(string))
                    configurations = optional(list(object({
                        classification = optional(string)
                        properties     = optional(map(string))
                    })))
                })))
                monitoring_configuration  = optional(list(object({
                    persistent_app_ui                    = optional(string)
                    cloud_watch_monitoring_configuration = optional(list(object({
                        log_group_name         = string
                        log_stream_name_prefix = optional(string)
                    })))
                    s3_monitoring_configuration          = optional(list(object({
                        log_uri = string
                    })))
                })))
            })))
            job_driver              = list(object({
                spark_sql_job_driver    = optional(list(object({
                    entry_point          = optional(string)
                    spark_sql_parameters = optional(string)
                })))
                spark_submit_job_driver = optional(list(object({
                    entry_point             = string
                    entry_point_arguments   = optional(set(string))
                    spark_submit_parameters = optional(string)
                })))
            }))
        }))
  }))
}
