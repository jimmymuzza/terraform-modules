variable "stack_hci_virtual_hard_disks" {
  description = <<EOT
Map of stack_hci_virtual_hard_disks, attributes below
Required:
    - custom_location_id
    - disk_size_in_gb
    - location
    - name
    - resource_group_name
Optional:
    - block_size_in_bytes
    - disk_file_format
    - dynamic_enabled
    - hyperv_generation
    - logical_sector_in_bytes
    - physical_sector_in_bytes
    - storage_path_id
    - tags
EOT

  type = map(object({
    custom_location_id       = string
    disk_size_in_gb          = number
    location                 = string
    name                     = string
    resource_group_name      = string
    block_size_in_bytes      = optional(number)
    disk_file_format         = optional(string)
    dynamic_enabled          = optional(bool)
    hyperv_generation        = optional(string)
    logical_sector_in_bytes  = optional(number)
    physical_sector_in_bytes = optional(number)
    storage_path_id          = optional(string)
    tags                     = optional(map(string))
  }))
}
