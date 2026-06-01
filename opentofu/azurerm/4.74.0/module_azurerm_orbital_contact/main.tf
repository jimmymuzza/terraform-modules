resource "azurerm_orbital_contact" "orbital_contacts" {
  for_each = var.orbital_contacts

  contact_profile_id     = each.value.contact_profile_id
  ground_station_name    = each.value.ground_station_name
  name                   = each.value.name
  reservation_end_time   = each.value.reservation_end_time
  reservation_start_time = each.value.reservation_start_time
  spacecraft_id          = each.value.spacecraft_id
}
