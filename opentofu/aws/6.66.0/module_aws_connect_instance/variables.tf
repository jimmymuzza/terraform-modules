variable "connect_instances" {
  description = <<EOT
Map of connect_instances, attributes below
Required:
    - identity_management_type
    - inbound_calls_enabled
    - outbound_calls_enabled
Optional:
    - auto_resolve_best_voices_enabled
    - contact_flow_logs_enabled
    - contact_lens_enabled
    - directory_id
    - early_media_enabled
    - instance_alias
    - multi_party_conference_enabled
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    identity_management_type         = string
    inbound_calls_enabled            = bool
    outbound_calls_enabled           = bool
    auto_resolve_best_voices_enabled = optional(bool)
    contact_flow_logs_enabled        = optional(bool)
    contact_lens_enabled             = optional(bool)
    directory_id                     = optional(string)
    early_media_enabled              = optional(bool)
    instance_alias                   = optional(string)
    multi_party_conference_enabled   = optional(bool)
    region                           = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
  }))
}
