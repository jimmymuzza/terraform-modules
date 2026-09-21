variable "netapp_backup_policies" {
  description = <<EOT
Map of netapp_backup_policies, attributes below
Required:
    - account_name
    - location
    - name
    - resource_group_name
Optional:
    - daily_backups_to_keep
    - enabled
    - monthly_backups_to_keep
    - tags
    - weekly_backups_to_keep
EOT

  type = map(object({
    account_name            = string
    location                = string
    name                    = string
    resource_group_name     = string
    daily_backups_to_keep   = optional(number)
    enabled                 = optional(bool)
    monthly_backups_to_keep = optional(number)
    tags                    = optional(map(string))
    weekly_backups_to_keep  = optional(number)
  }))
}
