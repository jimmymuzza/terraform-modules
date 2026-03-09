variable "docdbelastic_clusters" {
  description = <<EOT
Map of docdbelastic_clusters, attributes below
Required:
    - admin_user_name
    - admin_user_password
    - auth_type
    - name
    - shard_capacity
    - shard_count
Optional:
    - backup_retention_period
    - kms_key_id
    - preferred_backup_window
    - preferred_maintenance_window
    - region
    - subnet_ids
    - tags
    - vpc_security_group_ids
EOT

  type = map(object({
    admin_user_name              = string
    admin_user_password          = string
    auth_type                    = string
    name                         = string
    shard_capacity               = number
    shard_count                  = number
    backup_retention_period      = optional(number)
    kms_key_id                   = optional(string)
    preferred_backup_window      = optional(string)
    preferred_maintenance_window = optional(string)
    region                       = optional(string)
    subnet_ids                   = optional(set(string))
    tags                         = optional(map(string))
    vpc_security_group_ids       = optional(set(string))
  }))
}
