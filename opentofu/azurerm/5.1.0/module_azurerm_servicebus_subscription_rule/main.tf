resource "azurerm_servicebus_subscription_rule" "servicebus_subscription_rules" {
  for_each = var.servicebus_subscription_rules

  filter_type     = each.value.filter_type
  name            = each.value.name
  subscription_id = each.value.subscription_id
  action          = each.value.action
  sql_filter      = each.value.sql_filter

  dynamic "correlation_filter" {
    for_each = each.value.correlation_filter != null ? each.value.correlation_filter : []
    content {
      content_type        = correlation_filter.value.content_type
      correlation_id      = correlation_filter.value.correlation_id
      label               = correlation_filter.value.label
      message_id          = correlation_filter.value.message_id
      properties          = correlation_filter.value.properties
      reply_to            = correlation_filter.value.reply_to
      reply_to_session_id = correlation_filter.value.reply_to_session_id
      session_id          = correlation_filter.value.session_id
      to                  = correlation_filter.value.to
    }
  }
}
