variable "workspaces_pools" {
  description = <<EOT
Map of workspaces_pools, attributes below
Required:
    - bundle_id
    - description
    - directory_id
    - pool_name
    - running_mode
Optional:
    - application_settings
    - region
    - tags
    - timeout_settings
    - capacity
EOT

  type = map(object({
    bundle_id            = string
    description          = string
    directory_id         = string
    pool_name            = string
    running_mode         = string
    application_settings = optional(list(object({
            settings_group = string
            status = string
        })))
    region               = optional(string)
    tags                 = optional(map(string))
    timeout_settings     = optional(list(object({
            disconnect_timeout_in_seconds = number
            idle_disconnect_timeout_in_seconds = number
            max_user_duration_in_seconds = number
        })))
    capacity             = optional(list(object({
            desired_user_sessions = number
        })))
  }))
}
