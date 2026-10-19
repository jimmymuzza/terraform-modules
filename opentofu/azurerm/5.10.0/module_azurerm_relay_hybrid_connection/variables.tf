variable "relay_hybrid_connections" {
  description = <<EOT
Map of relay_hybrid_connections, attributes below
Required:
    - name
    - relay_namespace_name
    - resource_group_name
Optional:
    - requires_client_authorization
    - user_metadata
EOT

  type = map(object({
    name                          = string
    relay_namespace_name          = string
    resource_group_name           = string
    requires_client_authorization = optional(bool)
    user_metadata                 = optional(string)
  }))
}
