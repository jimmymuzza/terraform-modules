variable "backup_logically_air_gapped_vaults" {
  description = <<EOT
Map of backup_logically_air_gapped_vaults, attributes below
Required:
    - max_retention_days
    - min_retention_days
    - name
Optional:
    - encryption_key_arn
    - region
    - tags
EOT

  type = map(object({
    max_retention_days = number
    min_retention_days = number
    name               = string
    encryption_key_arn = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
  }))
}
