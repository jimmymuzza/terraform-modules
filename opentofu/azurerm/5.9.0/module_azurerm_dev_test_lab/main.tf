resource "azurerm_dev_test_lab" "dev_test_labs" {
  for_each = var.dev_test_labs

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
