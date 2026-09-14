resource "azurerm_spring_cloud_custom_domain" "spring_cloud_custom_domains" {
  for_each = var.spring_cloud_custom_domains

  name                = each.value.name
  spring_cloud_app_id = each.value.spring_cloud_app_id
  certificate_name    = each.value.certificate_name
  thumbprint          = each.value.thumbprint
}
