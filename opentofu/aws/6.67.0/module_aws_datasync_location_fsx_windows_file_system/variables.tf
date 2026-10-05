variable "datasync_location_fsx_windows_file_systems" {
  description = <<EOT
Map of datasync_location_fsx_windows_file_systems, attributes below
Required:
    - fsx_filesystem_arn
    - password
    - security_group_arns
    - user
Optional:
    - domain
    - region
    - subdirectory
    - tags
    - tags_all
EOT

  type = map(object({
    fsx_filesystem_arn  = string
    password            = string
    security_group_arns = set(string)
    user                = string
    domain              = optional(string)
    region              = optional(string)
    subdirectory        = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
  }))
}
