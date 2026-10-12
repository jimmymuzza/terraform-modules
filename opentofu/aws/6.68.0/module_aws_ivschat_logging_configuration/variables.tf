variable "ivschat_logging_configurations" {
  description = <<EOT
Map of ivschat_logging_configurations, attributes below
Optional:
    - name
    - region
    - tags
    - tags_all
    - destination_configuration
EOT

  type = map(object({
    name                      = optional(string)
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    destination_configuration = optional(list(object({
            cloudwatch_logs = optional(list(object({
                log_group_name = string
            })))
            firehose        = optional(list(object({
                delivery_stream_name = string
            })))
            s3              = optional(list(object({
                bucket_name = string
            })))
        })))
  }))
}
