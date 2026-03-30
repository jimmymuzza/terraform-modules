resource "azurerm_maps_creator" "maps_creators" {
  for_each = var.maps_creators

  location        = each.value.location
  maps_account_id = each.value.maps_account_id
  name            = each.value.name
  storage_units   = each.value.storage_units
  tags            = each.value.tags
}
