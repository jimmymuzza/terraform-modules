variable "db_instance_automated_backups_replications" {
  description = <<EOT
Map of db_instance_automated_backups_replications, attributes below
Required:
    - source_db_instance_arn
Optional:
    - kms_key_id
    - pre_signed_url
    - region
    - retention_period
EOT

  type = map(object({
    source_db_instance_arn = string
    kms_key_id             = optional(string)
    pre_signed_url         = optional(string)
    region                 = optional(string)
    retention_period       = optional(number)
  }))
}
