resource "azurerm_stack_hci_marketplace_gallery_image" "stack_hci_marketplace_gallery_images" {
  for_each = var.stack_hci_marketplace_gallery_images

  custom_location_id  = each.value.custom_location_id
  hyperv_generation   = each.value.hyperv_generation
  location            = each.value.location
  name                = each.value.name
  os_type             = each.value.os_type
  resource_group_name = each.value.resource_group_name
  version             = each.value.version
  storage_path_id     = each.value.storage_path_id
  tags                = each.value.tags

  dynamic "identifier" {
    for_each = each.value.identifier != null ? each.value.identifier : []
    content {
      offer     = identifier.value.offer
      publisher = identifier.value.publisher
      sku       = identifier.value.sku
    }
  }
}
