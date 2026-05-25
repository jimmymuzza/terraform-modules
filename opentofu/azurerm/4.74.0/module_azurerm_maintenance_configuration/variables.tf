variable "maintenance_configurations" {
  description = <<EOT
Map of maintenance_configurations, attributes below
Required:
    - location
    - name
    - resource_group_name
    - scope
Optional:
    - in_guest_user_patch_mode
    - properties
    - tags
    - visibility
    - install_patches
    - window
EOT

  type = map(object({
    location                 = string
    name                     = string
    resource_group_name      = string
    scope                    = string
    in_guest_user_patch_mode = optional(string)
    properties               = optional(map(string))
    tags                     = optional(map(string))
    visibility               = optional(string)
    install_patches          = optional(list(object({
            reboot  = optional(string)
            linux   = optional(list(object({
                classifications_to_include    = optional(list(string))
                package_names_mask_to_exclude = optional(list(string))
                package_names_mask_to_include = optional(list(string))
            })))
            windows = optional(list(object({
                classifications_to_include = optional(list(string))
                kb_numbers_to_exclude      = optional(list(string))
                kb_numbers_to_include      = optional(list(string))
            })))
        })))
    window                   = optional(list(object({
            start_date_time      = string
            time_zone            = string
            duration             = optional(string)
            expiration_date_time = optional(string)
            recur_every          = optional(string)
        })))
  }))
}
