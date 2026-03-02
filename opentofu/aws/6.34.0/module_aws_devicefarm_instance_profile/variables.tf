variable "devicefarm_instance_profiles" {
  description = <<EOT
Map of devicefarm_instance_profiles, attributes below
Required:
    - name
Optional:
    - description
    - exclude_app_packages_from_cleanup
    - package_cleanup
    - reboot_after_use
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name                              = string
    description                       = optional(string)
    exclude_app_packages_from_cleanup = optional(set(string))
    package_cleanup                   = optional(bool)
    reboot_after_use                  = optional(bool)
    region                            = optional(string)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
  }))
}
