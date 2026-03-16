resource "azurerm_voice_services_communications_gateway" "voice_services_communications_gateways" {
  for_each = var.voice_services_communications_gateways

  codecs                                 = each.value.codecs
  connectivity                           = each.value.connectivity
  e911_type                              = each.value.e911_type
  location                               = each.value.location
  name                                   = each.value.name
  platforms                              = each.value.platforms
  resource_group_name                    = each.value.resource_group_name
  api_bridge                             = each.value.api_bridge
  auto_generated_domain_name_label_scope = each.value.auto_generated_domain_name_label_scope
  emergency_dial_strings                 = each.value.emergency_dial_strings
  microsoft_teams_voicemail_pilot_number = each.value.microsoft_teams_voicemail_pilot_number
  on_prem_mcp_enabled                    = each.value.on_prem_mcp_enabled
  tags                                   = each.value.tags

  dynamic "service_location" {
    for_each = each.value.service_location != null ? each.value.service_location : []
    content {
      location                                  = service_location.value.location
      operator_addresses                        = service_location.value.operator_addresses
      allowed_media_source_address_prefixes     = service_location.value.allowed_media_source_address_prefixes
      allowed_signaling_source_address_prefixes = service_location.value.allowed_signaling_source_address_prefixes
      esrp_addresses                            = service_location.value.esrp_addresses
    }
  }
}
