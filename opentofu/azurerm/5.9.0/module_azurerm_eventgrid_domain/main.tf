resource "azurerm_eventgrid_domain" "eventgrid_domains" {
  for_each = var.eventgrid_domains

  location                                  = each.value.location
  name                                      = each.value.name
  resource_group_name                       = each.value.resource_group_name
  auto_create_topic_with_first_subscription = each.value.auto_create_topic_with_first_subscription
  auto_delete_topic_with_last_subscription  = each.value.auto_delete_topic_with_last_subscription
  inbound_ip_rule                           = each.value.inbound_ip_rule
  input_schema                              = each.value.input_schema
  local_auth_enabled                        = each.value.local_auth_enabled
  public_network_access_enabled             = each.value.public_network_access_enabled
  tags                                      = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "input_mapping_default_values" {
    for_each = each.value.input_mapping_default_values != null ? each.value.input_mapping_default_values : []
    content {
      data_version = input_mapping_default_values.value.data_version
      event_type   = input_mapping_default_values.value.event_type
      subject      = input_mapping_default_values.value.subject
    }
  }

  dynamic "input_mapping_fields" {
    for_each = each.value.input_mapping_fields != null ? each.value.input_mapping_fields : []
    content {
      data_version = input_mapping_fields.value.data_version
      event_time   = input_mapping_fields.value.event_time
      event_type   = input_mapping_fields.value.event_type
      subject      = input_mapping_fields.value.subject
      topic        = input_mapping_fields.value.topic
    }
  }
}
