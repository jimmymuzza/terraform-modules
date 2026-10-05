resource "azurerm_data_factory_trigger_custom_event" "data_factory_trigger_custom_events" {
  for_each = var.data_factory_trigger_custom_events

  data_factory_id       = each.value.data_factory_id
  eventgrid_topic_id    = each.value.eventgrid_topic_id
  events                = each.value.events
  name                  = each.value.name
  activated             = each.value.activated
  additional_properties = each.value.additional_properties
  annotations           = each.value.annotations
  description           = each.value.description
  subject_begins_with   = each.value.subject_begins_with
  subject_ends_with     = each.value.subject_ends_with

  dynamic "pipeline" {
    for_each = each.value.pipeline != null ? each.value.pipeline : []
    content {
      name       = pipeline.value.name
      parameters = pipeline.value.parameters
    }
  }
}
