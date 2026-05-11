variable "fsx_ontap_storage_virtual_machines" {
  description = <<EOT
Map of fsx_ontap_storage_virtual_machines, attributes below
Required:
    - file_system_id
    - name
Optional:
    - region
    - root_volume_security_style
    - svm_admin_password
    - tags
    - tags_all
    - active_directory_configuration
EOT

  type = map(object({
    file_system_id                 = string
    name                           = string
    region                         = optional(string)
    root_volume_security_style     = optional(string)
    svm_admin_password             = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    active_directory_configuration = optional(list(object({
            netbios_name                                = optional(string)
            self_managed_active_directory_configuration = optional(list(object({
                dns_ips                                = set(string)
                domain_name                            = string
                password                               = string
                username                               = string
                file_system_administrators_group       = optional(string)
                organizational_unit_distinguished_name = optional(string)
            })))
        })))
  }))
}
