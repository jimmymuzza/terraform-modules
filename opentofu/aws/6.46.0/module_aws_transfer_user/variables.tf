variable "transfer_users" {
  description = <<EOT
Map of transfer_users, attributes below
Required:
    - role
    - server_id
    - user_name
Optional:
    - home_directory
    - home_directory_type
    - policy
    - region
    - tags
    - tags_all
    - home_directory_mappings
    - posix_profile
EOT

  type = map(object({
    role                    = string
    server_id               = string
    user_name               = string
    home_directory          = optional(string)
    home_directory_type     = optional(string)
    policy                  = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    home_directory_mappings = optional(list(object({
            entry  = string
            target = string
        })))
    posix_profile           = optional(list(object({
            gid            = number
            uid            = number
            secondary_gids = optional(set(number))
        })))
  }))
}
