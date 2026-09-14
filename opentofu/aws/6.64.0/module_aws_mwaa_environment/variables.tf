variable "mwaa_environments" {
  description = <<EOT
Map of mwaa_environments, attributes below
Required:
    - dag_s3_path
    - execution_role_arn
    - name
    - source_bucket_arn
    - network_configuration
Optional:
    - airflow_configuration_options
    - airflow_version
    - endpoint_management
    - environment_class
    - kms_key
    - max_webservers
    - max_workers
    - min_webservers
    - min_workers
    - plugins_s3_object_version
    - plugins_s3_path
    - region
    - requirements_s3_object_version
    - requirements_s3_path
    - schedulers
    - startup_script_s3_object_version
    - startup_script_s3_path
    - tags
    - tags_all
    - webserver_access_mode
    - weekly_maintenance_window_start
    - worker_replacement_strategy
    - logging_configuration
EOT

  type = map(object({
    dag_s3_path                      = string
    execution_role_arn               = string
    name                             = string
    source_bucket_arn                = string
    airflow_configuration_options    = optional(map(string))
    airflow_version                  = optional(string)
    endpoint_management              = optional(string)
    environment_class                = optional(string)
    kms_key                          = optional(string)
    max_webservers                   = optional(number)
    max_workers                      = optional(number)
    min_webservers                   = optional(number)
    min_workers                      = optional(number)
    plugins_s3_object_version        = optional(string)
    plugins_s3_path                  = optional(string)
    region                           = optional(string)
    requirements_s3_object_version   = optional(string)
    requirements_s3_path             = optional(string)
    schedulers                       = optional(number)
    startup_script_s3_object_version = optional(string)
    startup_script_s3_path           = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    webserver_access_mode            = optional(string)
    weekly_maintenance_window_start  = optional(string)
    worker_replacement_strategy      = optional(string)
    logging_configuration            = optional(list(object({
            dag_processing_logs = optional(list(object({
                enabled   = optional(bool)
                log_level = optional(string)
            })))
            scheduler_logs      = optional(list(object({
                enabled   = optional(bool)
                log_level = optional(string)
            })))
            task_logs           = optional(list(object({
                enabled   = optional(bool)
                log_level = optional(string)
            })))
            webserver_logs      = optional(list(object({
                enabled   = optional(bool)
                log_level = optional(string)
            })))
            worker_logs         = optional(list(object({
                enabled   = optional(bool)
                log_level = optional(string)
            })))
        })))
    network_configuration            = list(object({
            security_group_ids = set(string)
            subnet_ids         = set(string)
        }))
  }))
}
