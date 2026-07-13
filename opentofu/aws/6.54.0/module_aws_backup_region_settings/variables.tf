variable "backup_region_settings" {
  description = <<EOT
Map of backup_region_settings, attributes below
Required:
    - resource_type_opt_in_preference
Optional:
    - region
    - resource_type_management_preference
EOT

  type = map(object({
    resource_type_opt_in_preference     = map(bool)
    region                              = optional(string)
    resource_type_management_preference = optional(map(bool))
  }))
}
