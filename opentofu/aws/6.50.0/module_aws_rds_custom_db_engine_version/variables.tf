variable "rds_custom_db_engine_versions" {
  description = <<EOT
Map of rds_custom_db_engine_versions, attributes below
Required:
    - engine
    - engine_version
Optional:
    - database_installation_files_s3_bucket_name
    - database_installation_files_s3_prefix
    - description
    - filename
    - kms_key_id
    - manifest
    - manifest_hash
    - region
    - source_image_id
    - status
    - tags
    - tags_all
EOT

  type = map(object({
    engine                                     = string
    engine_version                             = string
    database_installation_files_s3_bucket_name = optional(string)
    database_installation_files_s3_prefix      = optional(string)
    description                                = optional(string)
    filename                                   = optional(string)
    kms_key_id                                 = optional(string)
    manifest                                   = optional(string)
    manifest_hash                              = optional(string)
    region                                     = optional(string)
    source_image_id                            = optional(string)
    status                                     = optional(string)
    tags                                       = optional(map(string))
    tags_all                                   = optional(map(string))
  }))
}
