variable "cognito_log_delivery_configurations" {
  description = <<EOT
Map of cognito_log_delivery_configurations, attributes below
Required:
    - user_pool_id
Optional:
    - region
    - log_configurations
EOT

  type = map(object({
    user_pool_id       = string
    region             = optional(string)
    log_configurations = optional(list(object({
            event_source                   = string
            log_level                      = string
            cloud_watch_logs_configuration = optional(list(object({
                log_group_arn = optional(string)
            })))
            firehose_configuration         = optional(list(object({
                stream_arn = optional(string)
            })))
            s3_configuration               = optional(list(object({
                bucket_arn = optional(string)
            })))
        })))
  }))
}
