variable "lambda_functions" {
  description = <<EOT
Map of lambda_functions, attributes below
Required:
    - function_name
    - role
Optional:
    - architectures
    - code_sha256
    - code_signing_config_arn
    - description
    - filename
    - handler
    - image_uri
    - kms_key_arn
    - layers
    - memory_size
    - package_type
    - publish
    - publish_to
    - region
    - replace_security_groups_on_destroy
    - replacement_security_group_ids
    - reserved_concurrent_executions
    - runtime
    - s3_bucket
    - s3_key
    - s3_object_version
    - skip_destroy
    - source_code_hash
    - source_kms_key_arn
    - tags
    - tags_all
    - timeout
    - capacity_provider_config
    - dead_letter_config
    - durable_config
    - environment
    - ephemeral_storage
    - file_system_config
    - image_config
    - logging_config
    - snap_start
    - tenancy_config
    - tracing_config
    - vpc_config
EOT

  type = map(object({
    function_name                      = string
    role                               = string
    architectures                      = optional(list(string))
    code_sha256                        = optional(string)
    code_signing_config_arn            = optional(string)
    description                        = optional(string)
    filename                           = optional(string)
    handler                            = optional(string)
    image_uri                          = optional(string)
    kms_key_arn                        = optional(string)
    layers                             = optional(list(string))
    memory_size                        = optional(number)
    package_type                       = optional(string)
    publish                            = optional(bool)
    publish_to                         = optional(string)
    region                             = optional(string)
    replace_security_groups_on_destroy = optional(bool)
    replacement_security_group_ids     = optional(set(string))
    reserved_concurrent_executions     = optional(number)
    runtime                            = optional(string)
    s3_bucket                          = optional(string)
    s3_key                             = optional(string)
    s3_object_version                  = optional(string)
    skip_destroy                       = optional(bool)
    source_code_hash                   = optional(string)
    source_kms_key_arn                 = optional(string)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    timeout                            = optional(number)
    capacity_provider_config           = optional(list(object({
            lambda_managed_instances_capacity_provider_config = list(object({
                capacity_provider_arn                     = string
                execution_environment_memory_gib_per_vcpu = optional(number)
                per_execution_environment_max_concurrency = optional(number)
            }))
        })))
    dead_letter_config                 = optional(list(object({
            target_arn = string
        })))
    durable_config                     = optional(list(object({
            execution_timeout = number
            retention_period  = optional(number)
        })))
    environment                        = optional(list(object({
            variables = optional(map(string))
        })))
    ephemeral_storage                  = optional(list(object({
            size = optional(number)
        })))
    file_system_config                 = optional(list(object({
            arn              = string
            local_mount_path = string
        })))
    image_config                       = optional(list(object({
            command           = optional(list(string))
            entry_point       = optional(list(string))
            working_directory = optional(string)
        })))
    logging_config                     = optional(list(object({
            log_format            = string
            application_log_level = optional(string)
            log_group             = optional(string)
            system_log_level      = optional(string)
        })))
    snap_start                         = optional(list(object({
            apply_on = string
        })))
    tenancy_config                     = optional(list(object({
            tenant_isolation_mode = string
        })))
    tracing_config                     = optional(list(object({
            mode = string
        })))
    vpc_config                         = optional(list(object({
            security_group_ids          = set(string)
            subnet_ids                  = set(string)
            ipv6_allowed_for_dual_stack = optional(bool)
        })))
  }))
}
