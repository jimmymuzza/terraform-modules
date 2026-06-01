variable "efs_file_systems" {
  description = <<EOT
Map of efs_file_systems, attributes below
Optional:
    - availability_zone_name
    - creation_token
    - encrypted
    - kms_key_id
    - performance_mode
    - provisioned_throughput_in_mibps
    - region
    - tags
    - tags_all
    - throughput_mode
    - lifecycle_policy
    - protection
EOT

  type = map(object({
    availability_zone_name          = optional(string)
    creation_token                  = optional(string)
    encrypted                       = optional(bool)
    kms_key_id                      = optional(string)
    performance_mode                = optional(string)
    provisioned_throughput_in_mibps = optional(number)
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    throughput_mode                 = optional(string)
    lifecycle_policy                = optional(list(object({
            transition_to_archive               = optional(string)
            transition_to_ia                    = optional(string)
            transition_to_primary_storage_class = optional(string)
        })))
    protection                      = optional(list(object({
            replication_overwrite = optional(string)
        })))
  }))
}
