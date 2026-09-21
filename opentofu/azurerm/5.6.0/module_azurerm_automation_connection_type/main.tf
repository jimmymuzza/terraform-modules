resource "azurerm_automation_connection_type" "automation_connection_types" {
  for_each = var.automation_connection_types

  automation_account_name = each.value.automation_account_name
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  is_global               = each.value.is_global

  dynamic "field" {
    for_each = each.value.field != null ? each.value.field : []
    content {
      name         = field.value.name
      type         = field.value.type
      is_encrypted = field.value.is_encrypted
      is_optional  = field.value.is_optional
    }
  }
}
