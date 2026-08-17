variable "odb_cloud_exadata_infrastructures" {
  description = <<EOT
Map of odb_cloud_exadata_infrastructures, attributes below
Required:
    - availability_zone_id
    - display_name
    - shape
Optional:
    - availability_zone
    - compute_count
    - customer_contacts_to_send_to_oci
    - database_server_type
    - region
    - storage_count
    - storage_server_type
    - tags
    - maintenance_window
EOT

  type = map(object({
    availability_zone_id             = string
    display_name                     = string
    shape                            = string
    availability_zone                = optional(string)
    compute_count                    = optional(number)
    customer_contacts_to_send_to_oci = optional(set(object({
            email = string
        })))
    database_server_type             = optional(string)
    region                           = optional(string)
    storage_count                    = optional(number)
    storage_server_type              = optional(string)
    tags                             = optional(map(string))
    maintenance_window               = optional(list(object({
            custom_action_timeout_in_mins    = number
            is_custom_action_timeout_enabled = bool
            patching_mode                    = string
            preference                       = string
            days_of_week                     = optional(set(object({
                name = string
            })))
            hours_of_day                     = optional(set(number))
            lead_time_in_weeks               = optional(number)
            months                           = optional(set(object({
                name = string
            })))
            weeks_of_month                   = optional(set(number))
        })))
  }))
}
