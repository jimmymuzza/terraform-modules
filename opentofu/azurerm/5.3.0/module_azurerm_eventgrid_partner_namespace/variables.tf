variable "eventgrid_partner_namespaces" {
  description = <<EOT
Map of eventgrid_partner_namespaces, attributes below
Required:
    - location
    - name
    - partner_registration_id
    - resource_group_name
Optional:
    - local_authentication_enabled
    - partner_topic_routing_mode
    - public_network_access
    - tags
    - inbound_ip_rule
EOT

  type = map(object({
    location                     = string
    name                         = string
    partner_registration_id      = string
    resource_group_name          = string
    local_authentication_enabled = optional(bool)
    partner_topic_routing_mode   = optional(string)
    public_network_access        = optional(string)
    tags                         = optional(map(string))
    inbound_ip_rule              = optional(list(object({
            ip_mask = string
            action  = optional(string)
        })))
  }))
}
