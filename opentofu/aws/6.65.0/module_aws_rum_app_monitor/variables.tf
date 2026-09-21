variable "rum_app_monitors" {
  description = <<EOT
Map of rum_app_monitors, attributes below
Required:
    - name
Optional:
    - cw_log_enabled
    - domain
    - domain_list
    - region
    - tags
    - tags_all
    - app_monitor_configuration
    - custom_events
EOT

  type = map(object({
    name                      = string
    cw_log_enabled            = optional(bool)
    domain                    = optional(string)
    domain_list               = optional(list(string))
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    app_monitor_configuration = optional(list(object({
            allow_cookies       = optional(bool)
            enable_xray         = optional(bool)
            excluded_pages      = optional(set(string))
            favorite_pages      = optional(set(string))
            guest_role_arn      = optional(string)
            identity_pool_id    = optional(string)
            included_pages      = optional(set(string))
            session_sample_rate = optional(number)
            telemetries         = optional(set(string))
        })))
    custom_events             = optional(list(object({
            status = optional(string)
        })))
  }))
}
