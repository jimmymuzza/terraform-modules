variable "apprunner_services" {
  description = <<EOT
Map of apprunner_services, attributes below
Required:
    - service_name
    - source_configuration
Optional:
    - auto_scaling_configuration_arn
    - region
    - tags
    - tags_all
    - encryption_configuration
    - health_check_configuration
    - instance_configuration
    - network_configuration
    - observability_configuration
EOT

  type = map(object({
    service_name                   = string
    auto_scaling_configuration_arn = optional(string)
    region                         = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    encryption_configuration       = optional(list(object({
            kms_key = string
        })))
    health_check_configuration     = optional(list(object({
            healthy_threshold   = optional(number)
            interval            = optional(number)
            path                = optional(string)
            protocol            = optional(string)
            timeout             = optional(number)
            unhealthy_threshold = optional(number)
        })))
    instance_configuration         = optional(list(object({
            cpu               = optional(string)
            instance_role_arn = optional(string)
            memory            = optional(string)
        })))
    network_configuration          = optional(list(object({
            ip_address_type       = optional(string)
            egress_configuration  = optional(list(object({
                egress_type       = optional(string)
                vpc_connector_arn = optional(string)
            })))
            ingress_configuration = optional(list(object({
                is_publicly_accessible = optional(bool)
            })))
        })))
    observability_configuration    = optional(list(object({
            observability_enabled           = bool
            observability_configuration_arn = optional(string)
        })))
    source_configuration           = list(object({
            auto_deployments_enabled     = optional(bool)
            authentication_configuration = optional(list(object({
                access_role_arn = optional(string)
                connection_arn  = optional(string)
            })))
            code_repository              = optional(list(object({
                repository_url      = string
                source_directory    = optional(string)
                code_configuration  = optional(list(object({
                    configuration_source      = string
                    code_configuration_values = optional(list(object({
                        runtime                       = string
                        build_command                 = optional(string)
                        port                          = optional(string)
                        runtime_environment_secrets   = optional(map(string))
                        runtime_environment_variables = optional(map(string))
                        start_command                 = optional(string)
                    })))
                })))
                source_code_version = list(object({
                    type  = string
                    value = string
                }))
            })))
            image_repository             = optional(list(object({
                image_identifier      = string
                image_repository_type = string
                image_configuration   = optional(list(object({
                    port                          = optional(string)
                    runtime_environment_secrets   = optional(map(string))
                    runtime_environment_variables = optional(map(string))
                    start_command                 = optional(string)
                })))
            })))
        }))
  }))
}
