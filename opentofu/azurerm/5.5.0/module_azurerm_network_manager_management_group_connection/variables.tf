variable "network_manager_management_group_connections" {
  description = <<EOT
Map of network_manager_management_group_connections, attributes below
Required:
    - management_group_id
    - name
    - network_manager_id
Optional:
    - description
EOT

  type = map(object({
    management_group_id = string
    name                = string
    network_manager_id  = string
    description         = optional(string)
  }))
}
