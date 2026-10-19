variable "network_manager_network_groups" {
  description = <<EOT
Map of network_manager_network_groups, attributes below
Required:
    - name
    - network_manager_id
Optional:
    - description
    - member_type
EOT

  type = map(object({
    name               = string
    network_manager_id = string
    description        = optional(string)
    member_type        = optional(string)
  }))
}
