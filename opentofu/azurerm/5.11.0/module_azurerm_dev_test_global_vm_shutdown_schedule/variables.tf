variable "dev_test_global_vm_shutdown_schedules" {
  description = <<EOT
Map of dev_test_global_vm_shutdown_schedules, attributes below
Required:
    - daily_recurrence_time
    - location
    - timezone
    - virtual_machine_id
    - notification_settings
Optional:
    - enabled
    - tags
EOT

  type = map(object({
    daily_recurrence_time = string
    location              = string
    timezone              = string
    virtual_machine_id    = string
    enabled               = optional(bool)
    tags                  = optional(map(string))
    notification_settings = list(object({
            enabled         = bool
            email           = optional(string)
            time_in_minutes = optional(number)
            webhook_url     = optional(string)
        }))
  }))
}
