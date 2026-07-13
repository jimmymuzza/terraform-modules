variable "securitylake_subscriber_notifications" {
  description = <<EOT
Map of securitylake_subscriber_notifications, attributes below
Required:
    - subscriber_id
Optional:
    - region
    - configuration
EOT

  type = map(object({
    subscriber_id = string
    region        = optional(string)
    configuration = optional(list(object({
            https_notification_configuration = optional(list(object({
                endpoint                    = string
                target_role_arn             = string
                authorization_api_key_name  = optional(string)
                authorization_api_key_value = optional(string)
                http_method                 = optional(string)
            })))
            sqs_notification_configuration   = optional(list(object({

            })))
        })))
  }))
}
