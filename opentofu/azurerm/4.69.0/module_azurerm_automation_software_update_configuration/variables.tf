variable "automation_software_update_configurations" {
  description = <<EOT
Map of automation_software_update_configurations, attributes below
Required:
    - automation_account_id
    - name
    - schedule
Optional:
    - duration
    - non_azure_computer_names
    - virtual_machine_ids
    - linux
    - post_task
    - pre_task
    - target
    - windows
EOT

  type = map(object({
    automation_account_id    = string
    name                     = string
    duration                 = optional(string)
    non_azure_computer_names = optional(list(string))
    virtual_machine_ids      = optional(list(string))
    linux                    = optional(list(object({
            classifications_included = list(string)
            excluded_packages        = optional(list(string))
            included_packages        = optional(list(string))
            reboot                   = optional(string)
        })))
    post_task                = optional(list(object({
            parameters = optional(map(string))
            source     = optional(string)
        })))
    pre_task                 = optional(list(object({
            parameters = optional(map(string))
            source     = optional(string)
        })))
    schedule                 = list(object({
            frequency                  = string
            advanced_month_days        = optional(list(number))
            advanced_week_days         = optional(list(string))
            description                = optional(string)
            expiry_time                = optional(string)
            expiry_time_offset_minutes = optional(number)
            interval                   = optional(number)
            is_enabled                 = optional(bool)
            next_run                   = optional(string)
            next_run_offset_minutes    = optional(number)
            start_time                 = optional(string)
            start_time_offset_minutes  = optional(number)
            time_zone                  = optional(string)
            monthly_occurrence         = optional(list(object({
                day        = string
                occurrence = number
            })))
        }))
    target                   = optional(list(object({
            azure_query     = optional(list(object({
                locations  = optional(list(string))
                scope      = optional(list(string))
                tag_filter = optional(string)
                tags       = optional(list(object({
                    tag    = string
                    values = list(string)
                })))
            })))
            non_azure_query = optional(list(object({
                function_alias = optional(string)
                workspace_id   = optional(string)
            })))
        })))
    windows                  = optional(list(object({
            classifications_included        = list(string)
            excluded_knowledge_base_numbers = optional(list(string))
            included_knowledge_base_numbers = optional(list(string))
            reboot                          = optional(string)
        })))
  }))
}
