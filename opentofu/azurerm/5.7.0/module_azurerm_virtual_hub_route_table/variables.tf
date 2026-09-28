variable "virtual_hub_route_tables" {
  description = <<EOT
Map of virtual_hub_route_tables, attributes below
Required:
    - name
    - virtual_hub_id
Optional:
    - labels
    - route
EOT

  type = map(object({
    name           = string
    virtual_hub_id = string
    labels         = optional(set(string))
    route          = optional(set(object({
            destinations      = set(string)
            destinations_type = string
            name              = string
            next_hop          = string
            next_hop_type     = optional(string)
        })))
  }))
}
