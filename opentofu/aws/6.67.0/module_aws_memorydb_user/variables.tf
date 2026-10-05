variable "memorydb_users" {
  description = <<EOT
Map of memorydb_users, attributes below
Required:
    - access_string
    - user_name
    - authentication_mode
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    access_string       = string
    user_name           = string
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
    authentication_mode = list(object({
            type      = string
            passwords = optional(set(string))
        }))
  }))
}
