resource "azurerm_spring_cloud_gateway_custom_domain" "spring_cloud_gateway_custom_domains" {
  for_each = var.spring_cloud_gateway_custom_domains

  name                    = each.value.name
  spring_cloud_gateway_id = each.value.spring_cloud_gateway_id
  thumbprint              = each.value.thumbprint
}
