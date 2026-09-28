variable "dev_test_virtual_networks" {
  description = <<EOT
Map of dev_test_virtual_networks, attributes below
Required:
    - lab_name
    - name
    - resource_group_name
Optional:
    - description
    - tags
    - subnet
EOT

  type = map(object({
    lab_name            = string
    name                = string
    resource_group_name = string
    description         = optional(string)
    tags                = optional(map(string))
    subnet              = optional(list(object({
            use_in_virtual_machine_creation = optional(string)
            use_public_ip_address           = optional(string)
            shared_public_ip_address        = optional(list(object({
                allowed_ports = optional(list(object({
                    backend_port       = optional(number)
                    transport_protocol = optional(string)
                })))
            })))
        })))
  }))
}
