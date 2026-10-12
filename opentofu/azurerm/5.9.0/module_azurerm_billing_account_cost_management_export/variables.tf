variable "billing_account_cost_management_exports" {
  description = <<EOT
Map of billing_account_cost_management_exports, attributes below
Required:
    - billing_account_id
    - name
    - recurrence_period_end_date
    - recurrence_period_start_date
    - recurrence_type
    - export_data_options
    - export_data_storage_location
Optional:
    - active
    - file_format
EOT

  type = map(object({
    billing_account_id           = string
    name                         = string
    recurrence_period_end_date   = string
    recurrence_period_start_date = string
    recurrence_type              = string
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
