resource "azurerm_spring_cloud_certificate" "spring_cloud_certificates" {
  for_each = var.spring_cloud_certificates

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  service_name             = each.value.service_name
  certificate_content      = each.value.certificate_content
  exclude_private_key      = each.value.exclude_private_key
  key_vault_certificate_id = each.value.key_vault_certificate_id
}
