variable "ssm_maintenance_windows" {
  description = <<EOT
Map of ssm_maintenance_windows, attributes below
Required:
    - cutoff
    - duration
    - name
    - schedule
Optional:
    - allow_unassociated_targets
    - description
    - enabled
    - end_date
    - region
    - schedule_offset
    - schedule_timezone
    - start_date
    - tags
    - tags_all
EOT

  type = map(object({
    cutoff                     = number
    duration                   = number
    name                       = string
    schedule                   = string
    allow_unassociated_targets = optional(bool)
    description                = optional(string)
    enabled                    = optional(bool)
    end_date                   = optional(string)
    region                     = optional(string)
    schedule_offset            = optional(number)
    schedule_timezone          = optional(string)
    start_date                 = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
  }))
}
