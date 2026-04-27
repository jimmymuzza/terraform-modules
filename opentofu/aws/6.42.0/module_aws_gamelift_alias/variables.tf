variable "gamelift_alias" {
  description = <<EOT
Map of gamelift_alias, attributes below
Required:
    - name
    - routing_strategy
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name             = string
    description      = optional(string)
    region           = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
    routing_strategy = list(object({
            type     = string
            fleet_id = optional(string)
            message  = optional(string)
        }))
  }))
}
