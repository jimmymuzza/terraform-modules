resource "azurerm_managed_application" "managed_applications" {
  for_each = var.managed_applications

  kind                        = each.value.kind
  location                    = each.value.location
  managed_resource_group_name = each.value.managed_resource_group_name
  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  application_definition_id   = each.value.application_definition_id
  parameter_values            = each.value.parameter_values
  tags                        = each.value.tags

  dynamic "plan" {
    for_each = each.value.plan != null ? each.value.plan : []
    content {
      name           = plan.value.name
      product        = plan.value.product
      publisher      = plan.value.publisher
      version        = plan.value.version
      promotion_code = plan.value.promotion_code
    }
  }
}
