resource "azurerm_log_analytics_saved_search" "log_analytics_saved_searches" {
  for_each = var.log_analytics_saved_searches

  category                   = each.value.category
  display_name               = each.value.display_name
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  query                      = each.value.query
  function_alias             = each.value.function_alias
  function_parameters        = each.value.function_parameters
  tags                       = each.value.tags
}
