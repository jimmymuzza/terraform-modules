variable "dataexchange_revision_assets" {
  description = <<EOT
Map of dataexchange_revision_assets, attributes below
Required:
    - data_set_id
Optional:
    - comment
    - finalized
    - force_destroy
    - region
    - tags
    - asset
EOT

  type = map(object({
    data_set_id   = string
    comment       = optional(string)
    finalized     = optional(bool)
    force_destroy = optional(bool)
    region        = optional(string)
    tags          = optional(map(string))
    asset         = optional(set(object({
            create_s3_data_access_from_s3_bucket = optional(list(object({
                asset_source = optional(list(object({
                    bucket            = string
                    key_prefixes      = optional(set(string))
                    keys              = optional(set(string))
                    kms_keys_to_grant = optional(list(object({
                        kms_key_arn = string
                    })))
                })))
            })))
            import_assets_from_s3                = optional(list(object({
                asset_source = optional(list(object({
                    bucket = string
                    key    = string
                })))
            })))
            import_assets_from_signed_url        = optional(list(object({
                filename = string
            })))
        })))
  }))
}
