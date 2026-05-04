resource "azurerm_dev_center_gallery" "dev_center_galleries" {
  for_each = var.dev_center_galleries

  dev_center_id     = each.value.dev_center_id
  name              = each.value.name
  shared_gallery_id = each.value.shared_gallery_id
}
