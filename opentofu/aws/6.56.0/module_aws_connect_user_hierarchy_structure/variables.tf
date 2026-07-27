variable "connect_user_hierarchy_structures" {
  description = <<EOT
Map of connect_user_hierarchy_structures, attributes below
Required:
    - instance_id
    - hierarchy_structure
Optional:
    - region
EOT

  type = map(object({
    instance_id         = string
    region              = optional(string)
    hierarchy_structure = list(object({
            level_five  = optional(list(object({
                name = string
            })))
            level_four  = optional(list(object({
                name = string
            })))
            level_one   = optional(list(object({
                name = string
            })))
            level_three = optional(list(object({
                name = string
            })))
            level_two   = optional(list(object({
                name = string
            })))
        }))
  }))
}
