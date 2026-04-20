resource "azurerm_palo_alto_virtual_network_appliance" "palo_alto_virtual_network_appliances" {
  for_each = var.palo_alto_virtual_network_appliances

  name           = each.value.name
  virtual_hub_id = each.value.virtual_hub_id
}
