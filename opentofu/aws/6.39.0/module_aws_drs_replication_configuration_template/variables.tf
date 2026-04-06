variable "drs_replication_configuration_templates" {
  description = <<EOT
Map of drs_replication_configuration_templates, attributes below
Required:
    - associate_default_security_group
    - bandwidth_throttling
    - create_public_ip
    - data_plane_routing
    - default_large_staging_disk_type
    - ebs_encryption
    - replication_server_instance_type
    - replication_servers_security_groups_ids
    - staging_area_subnet_id
    - staging_area_tags
    - use_dedicated_replication_server
Optional:
    - auto_replicate_new_disks
    - ebs_encryption_key_arn
    - region
    - tags
    - pit_policy
EOT

  type = map(object({
    associate_default_security_group        = bool
    bandwidth_throttling                    = number
    create_public_ip                        = bool
    data_plane_routing                      = string
    default_large_staging_disk_type         = string
    ebs_encryption                          = string
    replication_server_instance_type        = string
    replication_servers_security_groups_ids = list(string)
    staging_area_subnet_id                  = string
    staging_area_tags                       = map(string)
    use_dedicated_replication_server        = bool
    auto_replicate_new_disks                = optional(bool)
    ebs_encryption_key_arn                  = optional(string)
    region                                  = optional(string)
    tags                                    = optional(map(string))
    pit_policy                              = optional(list(object({
            interval           = number
            retention_duration = number
            units              = string
            enabled            = optional(bool)
            rule_id            = optional(number)
        })))
  }))
}
