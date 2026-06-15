resource "azurerm_oracle_resource_anchor" "oracle_resource_anchors" {
  for_each = var.oracle_resource_anchors

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
