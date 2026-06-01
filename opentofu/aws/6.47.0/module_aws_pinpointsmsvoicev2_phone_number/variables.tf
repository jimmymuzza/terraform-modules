variable "pinpointsmsvoicev2_phone_numbers" {
  description = <<EOT
Map of pinpointsmsvoicev2_phone_numbers, attributes below
Required:
    - iso_country_code
    - message_type
    - number_capabilities
    - number_type
Optional:
    - deletion_protection_enabled
    - opt_out_list_name
    - region
    - registration_id
    - self_managed_opt_outs_enabled
    - tags
    - two_way_channel_arn
    - two_way_channel_enabled
    - two_way_channel_role
EOT

  type = map(object({
    iso_country_code              = string
    message_type                  = string
    number_capabilities           = set(string)
    number_type                   = string
    deletion_protection_enabled   = optional(bool)
    opt_out_list_name             = optional(string)
    region                        = optional(string)
    registration_id               = optional(string)
    self_managed_opt_outs_enabled = optional(bool)
    tags                          = optional(map(string))
    two_way_channel_arn           = optional(string)
    two_way_channel_enabled       = optional(bool)
    two_way_channel_role          = optional(string)
  }))
}
