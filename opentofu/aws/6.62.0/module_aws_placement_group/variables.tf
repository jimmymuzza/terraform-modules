variable "placement_groups" {
  description = <<EOT
Map of placement_groups, attributes below
Required:
    - name
    - strategy
Optional:
    - partition_count
    - region
    - spread_level
    - tags
    - tags_all
EOT

  type = map(object({
    name            = string
    strategy        = string
    partition_count = optional(number)
    region          = optional(string)
    spread_level    = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
  }))
}
