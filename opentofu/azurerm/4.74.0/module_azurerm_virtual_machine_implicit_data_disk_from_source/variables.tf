variable "virtual_machine_implicit_data_disk_from_sources" {
  description = <<EOT
Map of virtual_machine_implicit_data_disk_from_sources, attributes below
Required:
    - create_option
    - disk_size_gb
    - lun
    - name
    - source_resource_id
    - virtual_machine_id
Optional:
    - caching
    - write_accelerator_enabled
EOT

  type = map(object({
    create_option             = string
    disk_size_gb              = number
    lun                       = number
    name                      = string
    source_resource_id        = string
    virtual_machine_id        = string
    caching                   = optional(string)
    write_accelerator_enabled = optional(bool)
  }))
}
