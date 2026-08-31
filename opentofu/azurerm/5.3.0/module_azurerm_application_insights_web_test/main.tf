resource "azurerm_application_insights_web_test" "application_insights_web_tests" {
  for_each = var.application_insights_web_tests

  application_insights_id = each.value.application_insights_id
  configuration           = each.value.configuration
  geo_locations           = each.value.geo_locations
  kind                    = each.value.kind
  location                = each.value.location
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  description             = each.value.description
  enabled                 = each.value.enabled
  frequency               = each.value.frequency
  retry_enabled           = each.value.retry_enabled
  tags                    = each.value.tags
  timeout                 = each.value.timeout
}
