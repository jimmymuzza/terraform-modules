variable "network_manager_subscription_connections" {
  description = <<EOT
Map of network_manager_subscription_connections, attributes below
Required:
    - name
    - network_manager_id
    - subscription_id
Optional:
    - description
EOT

  type = map(object({
    name               = string
    network_manager_id = string
    subscription_id    = string
    description        = optional(string)
  }))
}
