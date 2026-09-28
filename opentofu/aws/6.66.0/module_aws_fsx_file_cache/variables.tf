variable "fsx_file_caches" {
  description = <<EOT
Map of fsx_file_caches, attributes below
Required:
    - file_cache_type
    - file_cache_type_version
    - storage_capacity
    - subnet_ids
Optional:
    - copy_tags_to_data_repository_associations
    - kms_key_id
    - region
    - security_group_ids
    - tags
    - tags_all
    - data_repository_association
    - lustre_configuration
EOT

  type = map(object({
    file_cache_type                           = string
    file_cache_type_version                   = string
    storage_capacity                          = number
    subnet_ids                                = list(string)
    copy_tags_to_data_repository_associations = optional(bool)
    kms_key_id                                = optional(string)
    region                                    = optional(string)
    security_group_ids                        = optional(set(string))
    tags                                      = optional(map(string))
    tags_all                                  = optional(map(string))
    data_repository_association               = optional(set(object({
            data_repository_path           = string
            file_cache_path                = string
            data_repository_subdirectories = optional(set(string))
            tags                           = optional(map(string))
            nfs                            = optional(set(object({
                version = string
                dns_ips = optional(set(string))
            })))
        })))
    lustre_configuration                      = optional(set(object({
            deployment_type               = string
            per_unit_storage_throughput   = number
            weekly_maintenance_start_time = optional(string)
            metadata_configuration        = set(object({
                storage_capacity = number
            }))
        })))
  }))
}
