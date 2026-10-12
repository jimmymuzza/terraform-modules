resource "azurerm_nginx_certificate" "nginx_certificates" {
  for_each = var.nginx_certificates

  certificate_virtual_path = each.value.certificate_virtual_path
  key_vault_secret_id      = each.value.key_vault_secret_id
  key_virtual_path         = each.value.key_virtual_path
  name                     = each.value.name
  nginx_deployment_id      = each.value.nginx_deployment_id
}
