variable "elasticache_users" {
  description = <<EOT
Map of elasticache_users, attributes below
Required:
    - access_string
    - engine
    - user_id
    - user_name
Optional:
    - no_password_required
    - passwords
    - region
    - tags
    - tags_all
    - authentication_mode
EOT

  type = map(object({
    access_string        = string
    engine               = string
    user_id              = string
    user_name            = string
    no_password_required = optional(bool)
    passwords            = optional(set(string))
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    authentication_mode  = optional(list(object({
            type      = string
            passwords = optional(set(string))
        })))
  }))
}
