variable "network_manager_static_members" {
  description = <<EOT
Map of network_manager_static_members, attributes below
Required:
    - name
    - network_group_id
    - target_virtual_network_id
EOT

  type = map(object({
    name                      = string
    network_group_id          = string
    target_virtual_network_id = string
  }))
}
