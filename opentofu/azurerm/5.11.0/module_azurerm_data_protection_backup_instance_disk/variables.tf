variable "data_protection_backup_instance_disks" {
  description = <<EOT
Map of data_protection_backup_instance_disks, attributes below
Required:
    - backup_policy_id
    - disk_id
    - location
    - name
    - snapshot_resource_group_name
    - vault_id
Optional:
    - snapshot_subscription_id
EOT

  type = map(object({
    backup_policy_id             = string
    disk_id                      = string
    location                     = string
    name                         = string
    snapshot_resource_group_name = string
    vault_id                     = string
    snapshot_subscription_id     = optional(string)
  }))
}
