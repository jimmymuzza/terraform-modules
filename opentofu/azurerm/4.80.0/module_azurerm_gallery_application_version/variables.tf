variable "gallery_application_versions" {
  description = <<EOT
Map of gallery_application_versions, attributes below
Required:
    - gallery_application_id
    - location
    - name
    - manage_action
    - source
    - target_region
Optional:
    - config_file
    - enable_health_check
    - end_of_life_date
    - exclude_from_latest
    - package_file
    - tags
EOT

  type = map(object({
    gallery_application_id = string
    location               = string
    name                   = string
    config_file            = optional(string)
    enable_health_check    = optional(bool)
    end_of_life_date       = optional(string)
    exclude_from_latest    = optional(bool)
    package_file           = optional(string)
    tags                   = optional(map(string))
    manage_action          = list(object({
            install = string
            remove  = string
            update  = optional(string)
        }))
    source                 = list(object({
            media_link                 = string
            default_configuration_link = optional(string)
        }))
    target_region          = list(object({
            name                   = string
            regional_replica_count = number
            exclude_from_latest    = optional(bool)
            storage_account_type   = optional(string)
        }))
  }))
}
