resource "azurerm_key_vault_managed_hardware_security_module" "key_vault_managed_hardware_security_modules" {
  for_each = var.key_vault_managed_hardware_security_modules

  admin_object_ids                          = each.value.admin_object_ids
  location                                  = each.value.location
  name                                      = each.value.name
  resource_group_name                       = each.value.resource_group_name
  sku_name                                  = each.value.sku_name
  tenant_id                                 = each.value.tenant_id
  public_network_access_enabled             = each.value.public_network_access_enabled
  purge_protection_enabled                  = each.value.purge_protection_enabled
  security_domain_key_vault_certificate_ids = each.value.security_domain_key_vault_certificate_ids
  security_domain_quorum                    = each.value.security_domain_quorum
  soft_delete_retention_days                = each.value.soft_delete_retention_days
  tags                                      = each.value.tags

  dynamic "network_acls" {
    for_each = each.value.network_acls != null ? each.value.network_acls : []
    content {
      bypass         = network_acls.value.bypass
      default_action = network_acls.value.default_action
    }
  }
}
