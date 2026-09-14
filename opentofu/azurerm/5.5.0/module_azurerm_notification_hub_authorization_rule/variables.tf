variable "notification_hub_authorization_rules" {
  description = <<EOT
Map of notification_hub_authorization_rules, attributes below
Required:
    - name
    - namespace_name
    - notification_hub_name
    - resource_group_name
Optional:
    - listen
    - manage
    - send
EOT

  type = map(object({
    name                  = string
    namespace_name        = string
    notification_hub_name = string
    resource_group_name   = string
    listen                = optional(bool)
    manage                = optional(bool)
    send                  = optional(bool)
  }))
}
