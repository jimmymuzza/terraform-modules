variable "pinpointsmsvoicev2_pools" {
  description = <<EOT
Map of pinpointsmsvoicev2_pools, attributes below
Required:
    - message_type
    - origination_identities
Optional:
    - deletion_protection_enabled
    - iso_country_code
    - opt_out_list_name
    - region
    - self_managed_opt_outs_enabled
    - shared_routes_enabled
    - tags
    - two_way_channel_arn
    - two_way_channel_role
    - two_way_enabled
EOT

  type = map(object({
    message_type                  = string
    origination_identities        = set(string)
    deletion_protection_enabled   = optional(bool)
    iso_country_code              = optional(string)
    opt_out_list_name             = optional(string)
    region                        = optional(string)
    self_managed_opt_outs_enabled = optional(bool)
    shared_routes_enabled         = optional(bool)
    tags                          = optional(map(string))
    two_way_channel_arn           = optional(string)
    two_way_channel_role          = optional(string)
    two_way_enabled               = optional(bool)
  }))
}
