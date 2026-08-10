variable "oracle_exadata_infrastructures" {
  description = <<EOT
Map of oracle_exadata_infrastructures, attributes below
Required:
    - compute_count
    - display_name
    - location
    - name
    - resource_group_name
    - shape
    - storage_count
    - zones
Optional:
    - customer_contacts
    - database_server_type
    - storage_server_type
    - tags
    - maintenance_window
EOT

  type = map(object({
    compute_count        = number
    display_name         = string
    location             = string
    name                 = string
    resource_group_name  = string
    shape                = string
    storage_count        = number
    zones                = set(string)
    customer_contacts    = optional(list(string))
    database_server_type = optional(string)
    storage_server_type  = optional(string)
    tags                 = optional(map(string))
    maintenance_window   = optional(list(object({
            days_of_week       = optional(list(string))
            hours_of_day       = optional(list(number))
            lead_time_in_weeks = optional(number)
            months             = optional(list(string))
            patching_mode      = optional(string)
            preference         = optional(string)
            weeks_of_month     = optional(list(number))
        })))
  }))
}
