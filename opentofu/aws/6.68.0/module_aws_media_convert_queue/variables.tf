variable "media_convert_queues" {
  description = <<EOT
Map of media_convert_queues, attributes below
Required:
    - name
Optional:
    - concurrent_jobs
    - description
    - pricing_plan
    - region
    - status
    - tags
    - tags_all
    - reservation_plan_settings
EOT

  type = map(object({
    name                      = string
    concurrent_jobs           = optional(number)
    description               = optional(string)
    pricing_plan              = optional(string)
    region                    = optional(string)
    status                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    reservation_plan_settings = optional(list(object({
            commitment     = string
            renewal_type   = string
            reserved_slots = number
        })))
  }))
}
