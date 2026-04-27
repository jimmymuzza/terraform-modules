resource "azurerm_eventgrid_namespace_topic" "eventgrid_namespace_topics" {
  for_each = var.eventgrid_namespace_topics

  eventgrid_namespace_id  = each.value.eventgrid_namespace_id
  name                    = each.value.name
  event_retention_in_days = each.value.event_retention_in_days
}
