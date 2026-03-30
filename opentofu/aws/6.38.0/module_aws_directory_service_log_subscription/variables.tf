variable "directory_service_log_subscriptions" {
  description = <<EOT
Map of directory_service_log_subscriptions, attributes below
Required:
    - directory_id
    - log_group_name
Optional:
    - region
EOT

  type = map(object({
    directory_id   = string
    log_group_name = string
    region         = optional(string)
  }))
}
