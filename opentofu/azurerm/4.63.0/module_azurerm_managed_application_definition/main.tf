resource "azurerm_managed_application_definition" "managed_application_definitions" {
  for_each = var.managed_application_definitions

  display_name         = each.value.display_name
  location             = each.value.location
  lock_level           = each.value.lock_level
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  create_ui_definition = each.value.create_ui_definition
  description          = each.value.description
  main_template        = each.value.main_template
  package_enabled      = each.value.package_enabled
  package_file_uri     = each.value.package_file_uri
  tags                 = each.value.tags

  dynamic "authorization" {
    for_each = each.value.authorization != null ? each.value.authorization : []
    content {
      role_definition_id   = authorization.value.role_definition_id
      service_principal_id = authorization.value.service_principal_id
    }
  }
}
