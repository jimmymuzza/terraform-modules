variable "spring_cloud_connections" {
  description = <<EOT
Map of spring_cloud_connections, attributes below
Required:
    - name
    - spring_cloud_id
    - target_resource_id
    - authentication
Optional:
    - client_type
    - vnet_solution
    - secret_store
EOT

  type = map(object({
    name               = string
    spring_cloud_id    = string
    target_resource_id = string
    client_type        = optional(string)
    vnet_solution      = optional(string)
    authentication     = list(object({
            type            = string
            certificate     = optional(string)
            client_id       = optional(string)
            name            = optional(string)
            principal_id    = optional(string)
            secret          = optional(string)
            subscription_id = optional(string)
        }))
    secret_store       = optional(list(object({
            key_vault_id = string
        })))
  }))
}
