variable "emrserverless_applications" {
  description = <<EOT
Map of emrserverless_applications, attributes below
Required:
    - name
    - release_label
    - type
Optional:
    - architecture
    - region
    - tags
    - tags_all
    - auto_start_configuration
    - auto_stop_configuration
    - image_configuration
    - initial_capacity
    - interactive_configuration
    - maximum_capacity
    - monitoring_configuration
    - network_configuration
    - runtime_configuration
    - scheduler_configuration
EOT

  type = map(object({
    name                      = string
    release_label             = string
    type                      = string
    architecture              = optional(string)
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    auto_start_configuration  = optional(list(object({
            enabled = optional(bool)
        })))
    auto_stop_configuration   = optional(list(object({
            enabled              = optional(bool)
            idle_timeout_minutes = optional(number)
        })))
    image_configuration       = optional(list(object({
            image_uri = string
        })))
    initial_capacity          = optional(set(object({
            initial_capacity_type   = string
            initial_capacity_config = optional(list(object({
                worker_count         = number
                worker_configuration = optional(list(object({
                    cpu    = string
                    memory = string
                    disk   = optional(string)
                })))
            })))
        })))
    interactive_configuration = optional(list(object({
            livy_endpoint_enabled = optional(bool)
            studio_enabled        = optional(bool)
        })))
    maximum_capacity          = optional(list(object({
            cpu    = string
            memory = string
            disk   = optional(string)
        })))
    monitoring_configuration  = optional(list(object({
            cloudwatch_logging_configuration             = optional(list(object({
                enabled                = bool
                encryption_key_arn     = optional(string)
                log_group_name         = optional(string)
                log_stream_name_prefix = optional(string)
                log_types              = optional(set(object({
                    name   = string
                    values = set(string)
                })))
            })))
            managed_persistence_monitoring_configuration = optional(list(object({
                enabled            = optional(bool)
                encryption_key_arn = optional(string)
            })))
            prometheus_monitoring_configuration          = optional(list(object({
                remote_write_url = optional(string)
            })))
            s3_monitoring_configuration                  = optional(list(object({
                encryption_key_arn = optional(string)
                log_uri            = optional(string)
            })))
        })))
    network_configuration     = optional(list(object({
            security_group_ids = optional(set(string))
            subnet_ids         = optional(set(string))
        })))
    runtime_configuration     = optional(list(object({
            classification = string
            properties     = optional(map(string))
        })))
    scheduler_configuration   = optional(list(object({
            max_concurrent_runs   = optional(number)
            queue_timeout_minutes = optional(number)
        })))
  }))
}
