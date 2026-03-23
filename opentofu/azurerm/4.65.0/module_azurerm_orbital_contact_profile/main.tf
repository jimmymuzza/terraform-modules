resource "azurerm_orbital_contact_profile" "orbital_contact_profiles" {
  for_each = var.orbital_contact_profiles

  auto_tracking                     = each.value.auto_tracking
  location                          = each.value.location
  minimum_variable_contact_duration = each.value.minimum_variable_contact_duration
  name                              = each.value.name
  network_configuration_subnet_id   = each.value.network_configuration_subnet_id
  resource_group_name               = each.value.resource_group_name
  event_hub_uri                     = each.value.event_hub_uri
  minimum_elevation_degrees         = each.value.minimum_elevation_degrees
  tags                              = each.value.tags

  dynamic "links" {
    for_each = each.value.links != null ? each.value.links : []
    content {
      direction    = links.value.direction
      name         = links.value.name
      polarization = links.value.polarization

      dynamic "channels" {
        for_each = links.value.channels != null ? links.value.channels : []
        content {
          bandwidth_mhz              = channels.value.bandwidth_mhz
          center_frequency_mhz       = channels.value.center_frequency_mhz
          name                       = channels.value.name
          demodulation_configuration = channels.value.demodulation_configuration
          modulation_configuration   = channels.value.modulation_configuration

          dynamic "end_point" {
            for_each = channels.value.end_point != null ? channels.value.end_point : []
            content {
              end_point_name = end_point.value.end_point_name
              port           = end_point.value.port
              protocol       = end_point.value.protocol
              ip_address     = end_point.value.ip_address
            }
          }
        }
      }
    }
  }
}
