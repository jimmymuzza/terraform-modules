resource "azurerm_dedicated_host" "dedicated_hosts" {
  for_each = var.dedicated_hosts

  dedicated_host_group_id = each.value.dedicated_host_group_id
  location                = each.value.location
  name                    = each.value.name
  platform_fault_domain   = each.value.platform_fault_domain
  sku_name                = each.value.sku_name
  auto_replace_on_failure = each.value.auto_replace_on_failure
  license_type            = each.value.license_type
  tags                    = each.value.tags
}
