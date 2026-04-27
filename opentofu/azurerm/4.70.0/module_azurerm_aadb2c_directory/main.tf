resource "azurerm_aadb2c_directory" "aadb2c_directories" {
  for_each = var.aadb2c_directories

  data_residency_location = each.value.data_residency_location
  domain_name             = each.value.domain_name
  resource_group_name     = each.value.resource_group_name
  sku_name                = each.value.sku_name
  country_code            = each.value.country_code
  display_name            = each.value.display_name
  tags                    = each.value.tags
}
