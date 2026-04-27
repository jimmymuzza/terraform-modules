variable "servicebus_namespace_authorization_rules" {
  description = <<EOT
Map of servicebus_namespace_authorization_rules, attributes below
Required:
    - name
    - namespace_id
Optional:
    - listen
    - manage
    - send
EOT

  type = map(object({
    name         = string
    namespace_id = string
    listen       = optional(bool)
    manage       = optional(bool)
    send         = optional(bool)
  }))
}
