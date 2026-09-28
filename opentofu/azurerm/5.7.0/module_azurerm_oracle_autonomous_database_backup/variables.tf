variable "oracle_autonomous_database_backups" {
  description = <<EOT
Map of oracle_autonomous_database_backups, attributes below
Required:
    - autonomous_database_id
    - name
    - retention_period_in_days
Optional:
    - type
EOT

  type = map(object({
    autonomous_database_id   = string
    name                     = string
    retention_period_in_days = number
    type                     = optional(string)
  }))
}
