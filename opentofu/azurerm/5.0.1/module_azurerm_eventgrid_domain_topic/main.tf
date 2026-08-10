resource "azurerm_eventgrid_domain_topic" "eventgrid_domain_topics" {
  for_each = var.eventgrid_domain_topics

  domain_name         = each.value.domain_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
