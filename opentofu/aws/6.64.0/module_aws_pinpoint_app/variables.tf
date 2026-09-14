variable "pinpoint_apps" {
  description = <<EOT
Map of pinpoint_apps, attributes below
Optional:
    - name
    - name_prefix
    - region
    - tags
    - tags_all
    - campaign_hook
    - limits
    - quiet_time
EOT

  type = map(object({
    name          = optional(string)
    name_prefix   = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    campaign_hook = optional(list(object({
            lambda_function_name = optional(string)
            mode                 = optional(string)
            web_url              = optional(string)
        })))
    limits        = optional(list(object({
            daily               = optional(number)
            maximum_duration    = optional(number)
            messages_per_second = optional(number)
            total               = optional(number)
        })))
    quiet_time    = optional(list(object({
            end   = optional(string)
            start = optional(string)
        })))
  }))
}
