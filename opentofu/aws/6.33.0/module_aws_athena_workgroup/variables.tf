variable "athena_workgroups" {
  description = <<EOT
Map of athena_workgroups, attributes below
Required:
    - name
Optional:
    - description
    - force_destroy
    - region
    - state
    - tags
    - tags_all
    - configuration
EOT

  type = map(object({
    name          = string
    description   = optional(string)
    force_destroy = optional(bool)
    region        = optional(string)
    state         = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    configuration = optional(list(object({
            bytes_scanned_cutoff_per_query            = optional(number)
            enable_minimum_encryption_configuration   = optional(bool)
            enforce_workgroup_configuration           = optional(bool)
            execution_role                            = optional(string)
            publish_cloudwatch_metrics_enabled        = optional(bool)
            requester_pays_enabled                    = optional(bool)
            customer_content_encryption_configuration = optional(list(object({
                kms_key = optional(string)
            })))
            engine_version                            = optional(list(object({
                selected_engine_version = optional(string)
            })))
            identity_center_configuration             = optional(list(object({
                enable_identity_center       = optional(bool)
                identity_center_instance_arn = optional(string)
            })))
            managed_query_results_configuration       = optional(list(object({
                enabled                  = optional(bool)
                encryption_configuration = optional(list(object({
                    kms_key = optional(string)
                })))
            })))
            monitoring_configuration                  = optional(list(object({
                cloud_watch_logging_configuration = optional(list(object({
                    enabled                = bool
                    log_group              = optional(string)
                    log_stream_name_prefix = optional(string)
                    log_type               = optional(set(object({
                        key    = string
                        values = set(string)
                    })))
                })))
                managed_logging_configuration     = optional(list(object({
                    enabled = bool
                    kms_key = optional(string)
                })))
                s3_logging_configuration          = optional(list(object({
                    enabled      = bool
                    kms_key      = optional(string)
                    log_location = optional(string)
                })))
            })))
            result_configuration                      = optional(list(object({
                expected_bucket_owner    = optional(string)
                output_location          = optional(string)
                acl_configuration        = optional(list(object({
                    s3_acl_option = string
                })))
                encryption_configuration = optional(list(object({
                    encryption_option = optional(string)
                    kms_key_arn       = optional(string)
                })))
            })))
        })))
  }))
}
