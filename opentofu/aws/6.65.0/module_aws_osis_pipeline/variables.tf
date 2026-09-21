variable "osis_pipelines" {
  description = <<EOT
Map of osis_pipelines, attributes below
Required:
    - max_units
    - min_units
    - pipeline_configuration_body
    - pipeline_name
Optional:
    - pipeline_role_arn
    - region
    - tags
    - buffer_options
    - encryption_at_rest_options
    - log_publishing_options
    - vpc_options
EOT

  type = map(object({
    max_units                   = number
    min_units                   = number
    pipeline_configuration_body = string
    pipeline_name               = string
    pipeline_role_arn           = optional(string)
    region                      = optional(string)
    tags                        = optional(map(string))
    buffer_options              = optional(list(object({
            persistent_buffer_enabled = bool
        })))
    encryption_at_rest_options  = optional(list(object({
            kms_key_arn = string
        })))
    log_publishing_options      = optional(list(object({
            is_logging_enabled         = optional(bool)
            cloudwatch_log_destination = optional(list(object({
                log_group = string
            })))
        })))
    vpc_options                 = optional(list(object({
            subnet_ids              = set(string)
            security_group_ids      = optional(set(string))
            vpc_endpoint_management = optional(string)
        })))
  }))
}
