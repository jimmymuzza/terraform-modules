variable "arczonalshift_autoshift_observer_notification_status" {
  description = <<EOT
Map of arczonalshift_autoshift_observer_notification_status, attributes below
Required:
    - status
Optional:
    - region
EOT

  type = map(object({
    status = string
    region = optional(string)
  }))
}
