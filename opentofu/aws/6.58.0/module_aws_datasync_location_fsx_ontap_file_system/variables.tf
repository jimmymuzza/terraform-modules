variable "datasync_location_fsx_ontap_file_systems" {
  description = <<EOT
Map of datasync_location_fsx_ontap_file_systems, attributes below
Required:
    - security_group_arns
    - storage_virtual_machine_arn
    - protocol
Optional:
    - region
    - subdirectory
    - tags
    - tags_all
EOT

  type = map(object({
    security_group_arns         = set(string)
    storage_virtual_machine_arn = string
    region                      = optional(string)
    subdirectory                = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    protocol                    = list(object({
            nfs = optional(list(object({
                mount_options = list(object({
                    version = optional(string)
                }))
            })))
            smb = optional(list(object({
                password      = string
                user          = string
                domain        = optional(string)
                mount_options = list(object({
                    version = optional(string)
                }))
            })))
        }))
  }))
}
