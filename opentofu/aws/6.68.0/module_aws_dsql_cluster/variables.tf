variable "dsql_clusters" {
  description = <<EOT
Map of dsql_clusters, attributes below
Optional:
    - deletion_protection_enabled
    - force_destroy
    - kms_encryption_key
    - region
    - tags
    - multi_region_properties
EOT

  type = map(object({
    deletion_protection_enabled = optional(bool)
    force_destroy               = optional(bool)
    kms_encryption_key          = optional(string)
    region                      = optional(string)
    tags                        = optional(map(string))
    multi_region_properties     = optional(list(object({
            clusters       = optional(set(string))
            witness_region = optional(string)
        })))
  }))
}
