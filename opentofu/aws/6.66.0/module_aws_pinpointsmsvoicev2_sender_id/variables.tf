variable "pinpointsmsvoicev2_sender_ids" {
  description = <<EOT
Map of pinpointsmsvoicev2_sender_ids, attributes below
Required:
    - iso_country_code
    - sender_id
Optional:
    - deletion_protection_enabled
    - message_types
    - region
    - tags
EOT

  type = map(object({
    iso_country_code            = string
    sender_id                   = string
    deletion_protection_enabled = optional(bool)
    message_types               = optional(set(string))
    region                      = optional(string)
    tags                        = optional(map(string))
  }))
}
