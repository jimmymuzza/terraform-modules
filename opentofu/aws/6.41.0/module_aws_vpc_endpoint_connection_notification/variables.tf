variable "vpc_endpoint_connection_notifications" {
  description = <<EOT
Map of vpc_endpoint_connection_notifications, attributes below
Required:
    - connection_events
    - connection_notification_arn
Optional:
    - region
    - vpc_endpoint_id
    - vpc_endpoint_service_id
EOT

  type = map(object({
    connection_events           = set(string)
    connection_notification_arn = string
    region                      = optional(string)
    vpc_endpoint_id             = optional(string)
    vpc_endpoint_service_id     = optional(string)
  }))
}
