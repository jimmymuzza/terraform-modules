variable "system_center_virtual_machine_manager_servers" {
  description = <<EOT
Map of system_center_virtual_machine_manager_servers, attributes below
Required:
    - custom_location_id
    - fqdn
    - location
    - name
    - password
    - resource_group_name
    - username
Optional:
    - port
    - tags
EOT

  type = map(object({
    custom_location_id  = string
    fqdn                = string
    location            = string
    name                = string
    password            = string
    resource_group_name = string
    username            = string
    port                = optional(number)
    tags                = optional(map(string))
  }))
}
