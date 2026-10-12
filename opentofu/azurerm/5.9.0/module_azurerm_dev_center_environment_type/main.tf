resource "azurerm_dev_center_environment_type" "dev_center_environment_types" {
  for_each = var.dev_center_environment_types

  dev_center_id = each.value.dev_center_id
  name          = each.value.name
  tags          = each.value.tags
}
