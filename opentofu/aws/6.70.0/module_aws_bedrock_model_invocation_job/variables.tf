variable "bedrock_model_invocation_jobs" {
  description = <<EOT
Map of bedrock_model_invocation_jobs, attributes below
Required:
    - job_name
    - model_id
    - role_arn
Optional:
    - region
    - skip_destroy
    - timeout_duration_in_hours
    - input_data_config
    - output_data_config
    - vpc_config
EOT

  type = map(object({
    job_name                  = string
    model_id                  = string
    role_arn                  = string
    region                    = optional(string)
    skip_destroy              = optional(bool)
    timeout_duration_in_hours = optional(number)
    input_data_config         = optional(list(object({
            s3_input_data_config = optional(list(object({
                s3_uri          = string
                s3_bucket_owner = optional(string)
                s3_input_format = optional(string)
            })))
        })))
    output_data_config        = optional(list(object({
            s3_output_data_config = optional(list(object({
                s3_uri               = string
                s3_bucket_owner      = optional(string)
                s3_encryption_key_id = optional(string)
            })))
        })))
    vpc_config                = optional(list(object({
            security_group_ids = set(string)
            subnet_ids         = set(string)
        })))
  }))
}
