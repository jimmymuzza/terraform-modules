variable "elasticache_user_groups" {
  description = <<EOT
Map of elasticache_user_groups, attributes below
Required:
    - engine
    - user_group_id
Optional:
    - region
    - tags
    - tags_all
    - user_ids
EOT

  type = map(object({
    engine        = string
    user_group_id = string
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    user_ids      = optional(set(string))
  }))
}
