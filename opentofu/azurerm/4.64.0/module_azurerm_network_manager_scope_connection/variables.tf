variable "network_manager_scope_connections" {
  description = <<EOT
Map of network_manager_scope_connections, attributes below
Required:
    - name
    - network_manager_id
    - target_scope_id
    - tenant_id
Optional:
    - description
EOT

  type = map(object({
    name               = string
    network_manager_id = string
    target_scope_id    = string
    tenant_id          = string
    description        = optional(string)
  }))
}
