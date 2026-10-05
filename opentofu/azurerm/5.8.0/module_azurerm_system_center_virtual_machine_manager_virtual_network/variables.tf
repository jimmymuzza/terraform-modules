variable "system_center_virtual_machine_manager_virtual_networks" {
  description = <<EOT
Map of system_center_virtual_machine_manager_virtual_networks, attributes below
Required:
    - custom_location_id
    - location
    - name
    - resource_group_name
    - system_center_virtual_machine_manager_server_inventory_item_id
Optional:
    - tags
EOT

  type = map(object({
    custom_location_id                                             = string
    location                                                       = string
    name                                                           = string
    resource_group_name                                            = string
    system_center_virtual_machine_manager_server_inventory_item_id = string
    tags                                                           = optional(map(string))
  }))
}
