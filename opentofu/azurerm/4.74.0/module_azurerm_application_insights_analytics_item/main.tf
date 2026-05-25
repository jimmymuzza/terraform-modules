resource "azurerm_application_insights_analytics_item" "application_insights_analytics_items" {
  for_each = var.application_insights_analytics_items

  application_insights_id = each.value.application_insights_id
  content                 = each.value.content
  name                    = each.value.name
  scope                   = each.value.scope
  type                    = each.value.type
  function_alias          = each.value.function_alias
}
