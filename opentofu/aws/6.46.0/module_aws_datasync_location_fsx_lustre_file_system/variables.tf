variable "datasync_location_fsx_lustre_file_systems" {
  description = <<EOT
Map of datasync_location_fsx_lustre_file_systems, attributes below
Required:
    - fsx_filesystem_arn
    - security_group_arns
Optional:
    - region
    - subdirectory
    - tags
    - tags_all
EOT

  type = map(object({
    fsx_filesystem_arn  = string
    security_group_arns = set(string)
    region              = optional(string)
    subdirectory        = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
  }))
}
