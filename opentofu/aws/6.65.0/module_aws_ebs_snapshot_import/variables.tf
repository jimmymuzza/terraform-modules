variable "ebs_snapshot_imports" {
  description = <<EOT
Map of ebs_snapshot_imports, attributes below
Required:
    - disk_container
Optional:
    - description
    - encrypted
    - kms_key_id
    - permanent_restore
    - region
    - role_name
    - storage_tier
    - tags
    - tags_all
    - temporary_restore_days
    - client_data
EOT

  type = map(object({
    description            = optional(string)
    encrypted              = optional(bool)
    kms_key_id             = optional(string)
    permanent_restore      = optional(bool)
    region                 = optional(string)
    role_name              = optional(string)
    storage_tier           = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    temporary_restore_days = optional(number)
    client_data            = optional(list(object({
            comment      = optional(string)
            upload_end   = optional(string)
            upload_size  = optional(number)
            upload_start = optional(string)
        })))
    disk_container         = list(object({
            format      = string
            description = optional(string)
            url         = optional(string)
            user_bucket = optional(list(object({
                s3_bucket = string
                s3_key    = string
            })))
        }))
  }))
}
