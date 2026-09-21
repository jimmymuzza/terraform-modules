variable "relay_hybrid_connection_authorization_rules" {
  description = <<EOT
Map of relay_hybrid_connection_authorization_rules, attributes below
Required:
    - hybrid_connection_name
    - name
    - namespace_name
    - resource_group_name
Optional:
    - listen
    - manage
    - send
EOT

  type = map(object({
    hybrid_connection_name = string
    name                   = string
    namespace_name         = string
    resource_group_name    = string
    listen                 = optional(bool)
    manage                 = optional(bool)
    send                   = optional(bool)
  }))
}
