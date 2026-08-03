resource "azurerm_eventgrid_system_topic" "eventgrid_system_topics" {
  for_each = var.eventgrid_system_topics

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  source_resource_id  = each.value.source_resource_id
  topic_type          = each.value.topic_type
  tags                = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
