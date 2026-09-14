variable "network_profiles" {
  description = <<EOT
Map of network_profiles, attributes below
Required:
    - location
    - name
    - resource_group_name
    - container_network_interface
Optional:
    - tags
EOT

  type = map(object({
    location                    = string
    name                        = string
    resource_group_name         = string
    tags                        = optional(map(string))
    container_network_interface = list(object({
            name             = string
            ip_configuration = list(object({
                name      = string
                subnet_id = string
            }))
        }))
  }))
}
