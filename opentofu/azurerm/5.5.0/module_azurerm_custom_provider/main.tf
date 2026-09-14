resource "azurerm_custom_provider" "custom_providers" {
  for_each = var.custom_providers

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "action" {
    for_each = each.value.action != null ? each.value.action : []
    content {
      endpoint = action.value.endpoint
      name     = action.value.name
    }
  }

  dynamic "resource_type" {
    for_each = each.value.resource_type != null ? each.value.resource_type : []
    content {
      endpoint     = resource_type.value.endpoint
      name         = resource_type.value.name
      routing_type = resource_type.value.routing_type
    }
  }

  dynamic "validation" {
    for_each = each.value.validation != null ? each.value.validation : []
    content {
      specification = validation.value.specification
    }
  }
}
