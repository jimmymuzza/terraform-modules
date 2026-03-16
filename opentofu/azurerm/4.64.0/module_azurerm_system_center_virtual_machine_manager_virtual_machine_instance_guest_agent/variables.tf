variable "system_center_virtual_machine_manager_virtual_machine_instance_guest_agents" {
  description = <<EOT
Map of system_center_virtual_machine_manager_virtual_machine_instance_guest_agents, attributes below
Required:
    - password
    - scoped_resource_id
    - username
Optional:
    - provisioning_action
EOT

  type = map(object({
    password            = string
    scoped_resource_id  = string
    username            = string
    provisioning_action = optional(string)
  }))
}
