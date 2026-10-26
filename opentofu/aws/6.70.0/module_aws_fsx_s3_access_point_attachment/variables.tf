variable "fsx_s3_access_point_attachments" {
  description = <<EOT
Map of fsx_s3_access_point_attachments, attributes below
Required:
    - name
    - type
Optional:
    - region
    - openzfs_configuration
    - s3_access_point
EOT

  type = map(object({
    name                  = string
    type                  = string
    region                = optional(string)
    openzfs_configuration = optional(list(object({
            volume_id            = string
            file_system_identity = optional(list(object({
                type       = string
                posix_user = optional(list(object({
                    gid            = number
                    uid            = number
                    secondary_gids = optional(list(number))
                })))
            })))
        })))
    s3_access_point       = optional(list(object({
            policy            = optional(string)
            vpc_configuration = optional(list(object({
                vpc_id = optional(string)
            })))
        })))
  }))
}
