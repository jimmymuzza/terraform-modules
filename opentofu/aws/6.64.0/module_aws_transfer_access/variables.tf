variable "transfer_accesses" {
  description = <<EOT
Map of transfer_accesses, attributes below
Required:
    - external_id
    - server_id
Optional:
    - home_directory
    - home_directory_type
    - policy
    - region
    - role
    - home_directory_mappings
    - posix_profile
EOT

  type = map(object({
    external_id             = string
    server_id               = string
    home_directory          = optional(string)
    home_directory_type     = optional(string)
    policy                  = optional(string)
    region                  = optional(string)
    role                    = optional(string)
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
