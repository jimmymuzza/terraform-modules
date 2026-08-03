resource "azurerm_application_insights_api_key" "application_insights_api_keys" {
  for_each = var.application_insights_api_keys

  application_insights_id = each.value.application_insights_id
  name                    = each.value.name
  read_permissions        = each.value.read_permissions
  write_permissions       = each.value.write_permissions
}
