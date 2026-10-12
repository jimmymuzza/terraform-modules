variable "synthetics_canaries" {
  description = <<EOT
Map of synthetics_canaries, attributes below
Required:
    - artifact_s3_location
    - execution_role_arn
    - handler
    - name
    - runtime_version
    - schedule
Optional:
    - delete_lambda
    - failure_retention_period
    - kms_key_arn
    - region
    - s3_bucket
    - s3_key
    - s3_version
    - start_canary
    - success_retention_period
    - tags
    - tags_all
    - zip_file
    - artifact_config
    - run_config
    - vpc_config
EOT

  type = map(object({
    artifact_s3_location     = string
    execution_role_arn       = string
    handler                  = string
    name                     = string
    runtime_version          = string
    delete_lambda            = optional(bool)
    failure_retention_period = optional(number)
    kms_key_arn              = optional(string)
    region                   = optional(string)
    s3_bucket                = optional(string)
    s3_key                   = optional(string)
    s3_version               = optional(string)
    start_canary             = optional(bool)
    success_retention_period = optional(number)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    zip_file                 = optional(string)
    artifact_config          = optional(list(object({
            s3_encryption = optional(list(object({
                encryption_mode = optional(string)
                kms_key_arn     = optional(string)
            })))
        })))
    run_config               = optional(list(object({
            active_tracing        = optional(bool)
            environment_variables = optional(map(string))
            ephemeral_storage     = optional(number)
            memory_in_mb          = optional(number)
            timeout_in_seconds    = optional(number)
        })))
    schedule                 = list(object({
            expression          = string
            duration_in_seconds = optional(number)
            retry_config        = optional(list(object({
                max_retries = number
            })))
        }))
    vpc_config               = optional(list(object({
            ipv6_allowed_for_dual_stack = optional(bool)
            security_group_ids          = optional(set(string))
            subnet_ids                  = optional(set(string))
        })))
  }))
}
