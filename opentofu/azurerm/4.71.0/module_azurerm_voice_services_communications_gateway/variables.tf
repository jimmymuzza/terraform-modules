variable "voice_services_communications_gateways" {
  description = <<EOT
Map of voice_services_communications_gateways, attributes below
Required:
    - codecs
    - connectivity
    - e911_type
    - location
    - name
    - platforms
    - resource_group_name
    - service_location
Optional:
    - api_bridge
    - auto_generated_domain_name_label_scope
    - emergency_dial_strings
    - microsoft_teams_voicemail_pilot_number
    - on_prem_mcp_enabled
    - tags
EOT

  type = map(object({
    codecs                                 = string
    connectivity                           = string
    e911_type                              = string
    location                               = string
    name                                   = string
    platforms                              = list(string)
    resource_group_name                    = string
    api_bridge                             = optional(string)
    auto_generated_domain_name_label_scope = optional(string)
    emergency_dial_strings                 = optional(list(string))
    microsoft_teams_voicemail_pilot_number = optional(string)
    on_prem_mcp_enabled                    = optional(bool)
    tags                                   = optional(map(string))
    service_location                       = set(object({
            location                                  = string
            operator_addresses                        = set(string)
            allowed_media_source_address_prefixes     = optional(set(string))
            allowed_signaling_source_address_prefixes = optional(set(string))
            esrp_addresses                            = optional(set(string))
        }))
  }))
}
