resource "azurerm_data_factory_managed_private_endpoint" "data_factory_managed_private_endpoints" {
  for_each = var.data_factory_managed_private_endpoints

  data_factory_id    = each.value.data_factory_id
  name               = each.value.name
  target_resource_id = each.value.target_resource_id
  fqdns              = each.value.fqdns
  subresource_name   = each.value.subresource_name
}
