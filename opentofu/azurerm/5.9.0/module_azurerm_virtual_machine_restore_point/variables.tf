variable "virtual_machine_restore_points" {
  description = <<EOT
Map of virtual_machine_restore_points, attributes below
Required:
    - name
    - virtual_machine_restore_point_collection_id
Optional:
    - crash_consistency_mode_enabled
    - excluded_disks
EOT

  type = map(object({
    name                                        = string
    virtual_machine_restore_point_collection_id = string
    crash_consistency_mode_enabled              = optional(bool)
    excluded_disks                              = optional(set(string))
  }))
}
