variable "networkmanager_connect_attachments" {
  description = <<EOT
Map of networkmanager_connect_attachments, attributes below
Required:
    - core_network_id
    - edge_location
    - transport_attachment_id
    - options
Optional:
    - routing_policy_label
    - tags
    - tags_all
EOT

  type = map(object({
    core_network_id         = string
    edge_location           = string
    transport_attachment_id = string
    routing_policy_label    = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    options                 = list(object({
            protocol = optional(string)
        }))
  }))
}
