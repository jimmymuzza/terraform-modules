variable "route_maps" {
  description = <<EOT
Map of route_maps, attributes below
Required:
    - name
    - virtual_hub_id
Optional:
    - rule
EOT

  type = map(object({
    name           = string
    virtual_hub_id = string
    rule           = optional(list(object({
            name                 = string
            next_step_if_matched = optional(string)
            action               = optional(list(object({
                type      = string
                parameter = optional(list(object({
                    as_path      = optional(list(string))
                    community    = optional(list(string))
                    route_prefix = optional(list(string))
                })))
            })))
            match_criterion      = optional(list(object({
                match_condition = string
                as_path         = optional(list(string))
                community       = optional(list(string))
                route_prefix    = optional(list(string))
            })))
        })))
  }))
}
