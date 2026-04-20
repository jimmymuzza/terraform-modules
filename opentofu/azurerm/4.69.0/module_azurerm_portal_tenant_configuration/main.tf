resource "azurerm_portal_tenant_configuration" "portal_tenant_configurations" {
  for_each = var.portal_tenant_configurations

  private_markdown_storage_enforced = each.value.private_markdown_storage_enforced
}
