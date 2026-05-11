variable "datasync_location_efs" {
  description = <<EOT
Map of datasync_location_efs, attributes below
Required:
    - efs_file_system_arn
    - ec2_config
Optional:
    - access_point_arn
    - file_system_access_role_arn
    - in_transit_encryption
    - region
    - subdirectory
    - tags
    - tags_all
EOT

  type = map(object({
    efs_file_system_arn         = string
    access_point_arn            = optional(string)
    file_system_access_role_arn = optional(string)
    in_transit_encryption       = optional(string)
    region                      = optional(string)
    subdirectory                = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    ec2_config                  = list(object({
            security_group_arns = set(string)
            subnet_arn          = string
        }))
  }))
}
