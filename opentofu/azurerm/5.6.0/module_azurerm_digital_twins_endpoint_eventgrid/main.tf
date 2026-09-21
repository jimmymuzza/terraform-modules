resource "azurerm_digital_twins_endpoint_eventgrid" "digital_twins_endpoint_eventgrids" {
  for_each = var.digital_twins_endpoint_eventgrids

  digital_twins_id                     = each.value.digital_twins_id
  eventgrid_topic_endpoint             = each.value.eventgrid_topic_endpoint
  eventgrid_topic_primary_access_key   = each.value.eventgrid_topic_primary_access_key
  eventgrid_topic_secondary_access_key = each.value.eventgrid_topic_secondary_access_key
  name                                 = each.value.name
  dead_letter_storage_secret           = each.value.dead_letter_storage_secret
}
