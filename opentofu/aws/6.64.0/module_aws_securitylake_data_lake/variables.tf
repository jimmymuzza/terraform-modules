variable "securitylake_data_lakes" {
  description = <<EOT
Map of securitylake_data_lakes, attributes below
Required:
    - meta_store_manager_role_arn
Optional:
    - region
    - tags
    - configuration
EOT

  type = map(object({
    meta_store_manager_role_arn = string
    region                      = optional(string)
    tags                        = optional(map(string))
    configuration               = optional(list(object({
            region                    = string
            encryption_configuration  = optional(list(object({
                kms_key_id = string
            })))
            lifecycle_configuration   = optional(list(object({
                expiration = optional(list(object({
                    days = optional(number)
                })))
                transition = optional(set(object({
                    days          = optional(number)
                    storage_class = optional(string)
                })))
            })))
            replication_configuration = optional(list(object({
                regions  = optional(set(string))
                role_arn = optional(string)
            })))
        })))
  }))
}
