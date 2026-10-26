resource "azurerm_app_service_certificate" "app_service_certificates" {
  for_each = var.app_service_certificates

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  app_service_plan_id = each.value.app_service_plan_id
  key_vault_id        = each.value.key_vault_id
  key_vault_secret_id = each.value.key_vault_secret_id
  password            = each.value.password
  pfx_blob            = each.value.pfx_blob
  tags                = each.value.tags
}
