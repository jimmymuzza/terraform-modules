variable "devopsguru_notification_channels" {
  description = <<EOT
Map of devopsguru_notification_channels, attributes below
Optional:
    - region
    - filters
    - sns
EOT

  type = map(object({
    region  = optional(string)
    filters = optional(list(object({
            message_types = optional(set(string))
            severities    = optional(set(string))
        })))
    sns     = optional(list(object({
            topic_arn = string
        })))
  }))
}
