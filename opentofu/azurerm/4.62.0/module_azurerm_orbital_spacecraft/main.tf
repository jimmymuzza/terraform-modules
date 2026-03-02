resource "azurerm_orbital_spacecraft" "orbital_spacecrafts" {
  for_each = var.orbital_spacecrafts

  location            = each.value.location
  name                = each.value.name
  norad_id            = each.value.norad_id
  resource_group_name = each.value.resource_group_name
  title_line          = each.value.title_line
  two_line_elements   = each.value.two_line_elements
  tags                = each.value.tags

  dynamic "links" {
    for_each = each.value.links != null ? each.value.links : []
    content {
      bandwidth_mhz        = links.value.bandwidth_mhz
      center_frequency_mhz = links.value.center_frequency_mhz
      direction            = links.value.direction
      name                 = links.value.name
      polarization         = links.value.polarization
    }
  }
}
