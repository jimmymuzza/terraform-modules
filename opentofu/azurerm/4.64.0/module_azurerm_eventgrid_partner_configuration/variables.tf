variable "eventgrid_partner_configurations" {
  description = <<EOT
Map of eventgrid_partner_configurations, attributes below
Required:
    - resource_group_name
Optional:
    - default_maximum_expiration_time_in_days
    - tags
    - partner_authorization
EOT

  type = map(object({
    resource_group_name                     = string
    default_maximum_expiration_time_in_days = optional(number)
    tags                                    = optional(map(string))
    partner_authorization                   = optional(list(object({
            partner_name                         = string
            partner_registration_id              = string
            authorization_expiration_time_in_utc = optional(string)
        })))
  }))
}
