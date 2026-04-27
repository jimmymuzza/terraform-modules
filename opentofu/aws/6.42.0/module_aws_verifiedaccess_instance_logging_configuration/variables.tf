variable "verifiedaccess_instance_logging_configurations" {
  description = <<EOT
Map of verifiedaccess_instance_logging_configurations, attributes below
Required:
    - verifiedaccess_instance_id
    - access_logs
Optional:
    - region
EOT

  type = map(object({
    verifiedaccess_instance_id = string
    region                     = optional(string)
    access_logs                = list(object({
            include_trust_context = optional(bool)
            log_version           = optional(string)
            cloudwatch_logs       = optional(list(object({
                enabled   = bool
                log_group = optional(string)
            })))
            kinesis_data_firehose = optional(list(object({
                enabled         = bool
                delivery_stream = optional(string)
            })))
            s3                    = optional(list(object({
                enabled      = bool
                bucket_name  = optional(string)
                bucket_owner = optional(string)
                prefix       = optional(string)
            })))
        }))
  }))
}
