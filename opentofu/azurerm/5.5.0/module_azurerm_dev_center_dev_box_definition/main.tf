resource "azurerm_dev_center_dev_box_definition" "dev_center_dev_box_definitions" {
  for_each = var.dev_center_dev_box_definitions

  dev_center_id             = each.value.dev_center_id
  image_reference_id        = each.value.image_reference_id
  location                  = each.value.location
  name                      = each.value.name
  sku_name                  = each.value.sku_name
  hibernate_support_enabled = each.value.hibernate_support_enabled
  tags                      = each.value.tags
}
