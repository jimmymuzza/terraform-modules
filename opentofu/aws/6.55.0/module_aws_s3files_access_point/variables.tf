variable "s3files_access_points" {
  description = <<EOT
Map of s3files_access_points, attributes below
Required:
    - file_system_id
Optional:
    - region
    - tags
    - posix_user
    - root_directory
EOT

  type = map(object({
    file_system_id = string
    region         = optional(string)
    tags           = optional(map(string))
    posix_user     = optional(list(object({
            gid            = number
            uid            = number
            secondary_gids = optional(set(number))
        })))
    root_directory = optional(list(object({
            path                 = optional(string)
            creation_permissions = optional(list(object({
                owner_gid   = number
                owner_uid   = number
                permissions = string
            })))
        })))
  }))
}
