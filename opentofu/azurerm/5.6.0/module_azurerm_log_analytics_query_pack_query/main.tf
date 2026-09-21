resource "azurerm_log_analytics_query_pack_query" "log_analytics_query_pack_queries" {
  for_each = var.log_analytics_query_pack_queries

  body                     = each.value.body
  display_name             = each.value.display_name
  query_pack_id            = each.value.query_pack_id
  additional_settings_json = each.value.additional_settings_json
  categories               = each.value.categories
  description              = each.value.description
  name                     = each.value.name
  resource_types           = each.value.resource_types
  solutions                = each.value.solutions
  tags                     = each.value.tags
}
