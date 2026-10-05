variable "netapp_snapshot_policies" {
  description = <<EOT
Map of netapp_snapshot_policies, attributes below
Required:
    - account_name
    - enabled
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - daily_schedule
    - hourly_schedule
    - monthly_schedule
    - weekly_schedule
EOT

  type = map(object({
    account_name        = string
    enabled             = bool
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    daily_schedule      = optional(list(object({
            hour              = number
            minute            = number
            snapshots_to_keep = number
        })))
    hourly_schedule     = optional(list(object({
            minute            = number
            snapshots_to_keep = number
        })))
    monthly_schedule    = optional(list(object({
            days_of_month     = set(number)
            hour              = number
            minute            = number
            snapshots_to_keep = number
        })))
    weekly_schedule     = optional(list(object({
            days_of_week      = set(string)
            hour              = number
            minute            = number
            snapshots_to_keep = number
        })))
  }))
}
