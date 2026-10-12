variable "ssmcontacts_plans" {
  description = <<EOT
Map of ssmcontacts_plans, attributes below
Required:
    - contact_id
    - stage
Optional:
    - region
EOT

  type = map(object({
    contact_id = string
    region     = optional(string)
    stage      = list(object({
            duration_in_minutes = number
            target              = optional(list(object({
                channel_target_info = optional(list(object({
                    contact_channel_id        = string
                    retry_interval_in_minutes = optional(number)
                })))
                contact_target_info = optional(list(object({
                    is_essential = bool
                    contact_id   = optional(string)
                })))
            })))
        }))
  }))
}
