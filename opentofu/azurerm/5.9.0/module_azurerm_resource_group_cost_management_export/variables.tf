variable "resource_group_cost_management_exports" {
  description = <<EOT
Map of resource_group_cost_management_exports, attributes below
Required:
    - name
    - recurrence_period_end_date
    - recurrence_period_start_date
    - recurrence_type
    - resource_group_id
    - export_data_options
    - export_data_storage_location
Optional:
    - active
    - file_format
EOT

  type = map(object({
    name                         = string
    recurrence_period_end_date   = string
    recurrence_period_start_date = string
    recurrence_type              = string
    resource_group_id            = string
    active                       = optional(bool)
    file_format                  = optional(string)
    export_data_options          = list(object({
            time_frame = string
            type       = string
        }))
    export_data_storage_location = list(object({
            container_id     = string
            root_folder_path = string
        }))
  }))
}
