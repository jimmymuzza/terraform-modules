variable "m2_environments" {
  description = <<EOT
Map of m2_environments, attributes below
Required:
    - engine_type
    - instance_type
    - name
Optional:
    - apply_changes_during_maintenance_window
    - description
    - engine_version
    - force_update
    - kms_key_id
    - preferred_maintenance_window
    - publicly_accessible
    - region
    - security_group_ids
    - subnet_ids
    - tags
    - high_availability_config
    - storage_configuration
EOT

  type = map(object({
    engine_type                             = string
    instance_type                           = string
    name                                    = string
    apply_changes_during_maintenance_window = optional(bool)
    description                             = optional(string)
    engine_version                          = optional(string)
    force_update                            = optional(bool)
    kms_key_id                              = optional(string)
    preferred_maintenance_window            = optional(string)
    publicly_accessible                     = optional(bool)
    region                                  = optional(string)
    security_group_ids                      = optional(set(string))
    subnet_ids                              = optional(set(string))
    tags                                    = optional(map(string))
    high_availability_config                = optional(list(object({
            desired_capacity = number
        })))
    storage_configuration                   = optional(list(object({
            efs = optional(list(object({
                file_system_id = string
                mount_point    = string
            })))
            fsx = optional(list(object({
                file_system_id = string
                mount_point    = string
            })))
        })))
  }))
}
