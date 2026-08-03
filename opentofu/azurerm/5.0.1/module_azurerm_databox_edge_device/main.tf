resource "azurerm_databox_edge_device" "databox_edge_devices" {
  for_each = var.databox_edge_devices

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  tags                = each.value.tags
}
