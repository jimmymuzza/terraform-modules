variable "backup_vault_notifications" {
  description = <<EOT
Map of backup_vault_notifications, attributes below
Required:
    - backup_vault_events
    - backup_vault_name
    - sns_topic_arn
Optional:
    - region
EOT

  type = map(object({
    backup_vault_events = set(string)
    backup_vault_name   = string
    sns_topic_arn       = string
    region              = optional(string)
  }))
}
