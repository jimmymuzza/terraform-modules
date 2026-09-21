resource "azurerm_arc_machine" "arc_machines" {
  for_each = var.arc_machines

  kind                = each.value.kind
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type = identity.value.type
    }
  }
}
