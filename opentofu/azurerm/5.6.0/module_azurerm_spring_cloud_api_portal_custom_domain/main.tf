resource "azurerm_spring_cloud_api_portal_custom_domain" "spring_cloud_api_portal_custom_domains" {
  for_each = var.spring_cloud_api_portal_custom_domains

  name                       = each.value.name
  spring_cloud_api_portal_id = each.value.spring_cloud_api_portal_id
  thumbprint                 = each.value.thumbprint
}
