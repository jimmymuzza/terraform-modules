variable "bedrock_model_invocation_logging_configurations" {
  description = <<EOT
Map of bedrock_model_invocation_logging_configurations, attributes below
Optional:
    - region
    - logging_config
EOT

  type = map(object({
    region         = optional(string)
    logging_config = optional(list(object({
            embedding_data_delivery_enabled = optional(bool)
            image_data_delivery_enabled     = optional(bool)
            text_data_delivery_enabled      = optional(bool)
            video_data_delivery_enabled     = optional(bool)
            cloudwatch_config               = optional(list(object({
                log_group_name                = string
                role_arn                      = string
                large_data_delivery_s3_config = optional(list(object({
                    bucket_name = string
                    key_prefix  = optional(string)
                })))
            })))
            s3_config                       = optional(list(object({
                bucket_name = string
                key_prefix  = optional(string)
            })))
        })))
  }))
}
