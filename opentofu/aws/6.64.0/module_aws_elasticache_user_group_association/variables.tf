variable "elasticache_user_group_associations" {
  description = <<EOT
Map of elasticache_user_group_associations, attributes below
Required:
    - user_group_id
    - user_id
Optional:
    - region
EOT

  type = map(object({
    user_group_id = string
    user_id       = string
    region        = optional(string)
  }))
}
