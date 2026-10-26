resource "aws_appintegrations_event_integration" "appintegrations_event_integrations" {
  for_each = var.appintegrations_event_integrations

  eventbridge_bus = each.value.eventbridge_bus
  name            = each.value.name
  description     = each.value.description
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all

  dynamic "event_filter" {
    for_each = each.value.event_filter != null ? each.value.event_filter : []
    content {
      source = event_filter.value.source
    }
  }
}
