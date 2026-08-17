variable "secretsmanager_secrets" {
  description = <<EOT
Map of secretsmanager_secrets, attributes below
Optional:
    - description
    - force_overwrite_replica_secret
    - kms_key_id
    - name
    - name_prefix
    - policy
    - recovery_window_in_days
    - region
    - tags
    - tags_all
    - type
    - replica
EOT

  type = map(object({
    description                    = optional(string)
    force_overwrite_replica_secret = optional(bool)
    kms_key_id                     = optional(string)
    name                           = optional(string)
    name_prefix                    = optional(string)
    policy                         = optional(string)
    recovery_window_in_days        = optional(number)
    region                         = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    type                           = optional(string)
    replica                        = optional(set(object({
            region     = string
            kms_key_id = optional(string)
        })))
  }))
}
