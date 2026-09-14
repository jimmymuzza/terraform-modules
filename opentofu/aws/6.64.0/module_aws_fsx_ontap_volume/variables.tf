variable "fsx_ontap_volumes" {
  description = <<EOT
Map of fsx_ontap_volumes, attributes below
Required:
    - name
    - storage_virtual_machine_id
Optional:
    - bypass_snaplock_enterprise_retention
    - copy_tags_to_backups
    - final_backup_tags
    - junction_path
    - ontap_volume_type
    - region
    - security_style
    - size_in_bytes
    - size_in_megabytes
    - skip_final_backup
    - snapshot_policy
    - storage_efficiency_enabled
    - tags
    - tags_all
    - volume_style
    - volume_type
    - aggregate_configuration
    - snaplock_configuration
    - tiering_policy
EOT

  type = map(object({
    name                                 = string
    storage_virtual_machine_id           = string
    bypass_snaplock_enterprise_retention = optional(bool)
    copy_tags_to_backups                 = optional(bool)
    final_backup_tags                    = optional(map(string))
    junction_path                        = optional(string)
    ontap_volume_type                    = optional(string)
    region                               = optional(string)
    security_style                       = optional(string)
    size_in_bytes                        = optional(string)
    size_in_megabytes                    = optional(number)
    skip_final_backup                    = optional(bool)
    snapshot_policy                      = optional(string)
    storage_efficiency_enabled           = optional(bool)
    tags                                 = optional(map(string))
    tags_all                             = optional(map(string))
    volume_style                         = optional(string)
    volume_type                          = optional(string)
    aggregate_configuration              = optional(list(object({
            aggregates                 = optional(list(string))
            constituents_per_aggregate = optional(number)
        })))
    snaplock_configuration               = optional(list(object({
            snaplock_type              = string
            audit_log_volume           = optional(bool)
            privileged_delete          = optional(string)
            volume_append_mode_enabled = optional(bool)
            autocommit_period          = optional(list(object({
                type  = optional(string)
                value = optional(number)
            })))
            retention_period           = optional(list(object({
                default_retention = optional(list(object({
                    type  = optional(string)
                    value = optional(number)
                })))
                maximum_retention = optional(list(object({
                    type  = optional(string)
                    value = optional(number)
                })))
                minimum_retention = optional(list(object({
                    type  = optional(string)
                    value = optional(number)
                })))
            })))
        })))
    tiering_policy                       = optional(list(object({
            cooling_period = optional(number)
            name           = optional(string)
        })))
  }))
}
