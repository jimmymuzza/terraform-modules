resource "azurerm_app_service_certificate_order" "app_service_certificate_orders" {
  for_each = var.app_service_certificate_orders

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  auto_renew          = each.value.auto_renew
  csr                 = each.value.csr
  distinguished_name  = each.value.distinguished_name
  key_size            = each.value.key_size
  product_type        = each.value.product_type
  tags                = each.value.tags
  validity_in_years   = each.value.validity_in_years
}
