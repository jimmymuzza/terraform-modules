resource "azurerm_servicebus_subscription" "servicebus_subscriptions" {
  for_each = var.servicebus_subscriptions

  max_delivery_count                        = each.value.max_delivery_count
  name                                      = each.value.name
  topic_id                                  = each.value.topic_id
  auto_delete_on_idle                       = each.value.auto_delete_on_idle
  batched_operations_enabled                = each.value.batched_operations_enabled
  client_scoped_subscription_enabled        = each.value.client_scoped_subscription_enabled
  dead_lettering_on_filter_evaluation_error = each.value.dead_lettering_on_filter_evaluation_error
  dead_lettering_on_message_expiration      = each.value.dead_lettering_on_message_expiration
  default_message_ttl                       = each.value.default_message_ttl
  forward_dead_lettered_messages_to         = each.value.forward_dead_lettered_messages_to
  forward_to                                = each.value.forward_to
  lock_duration                             = each.value.lock_duration
  requires_session                          = each.value.requires_session
  status                                    = each.value.status

  dynamic "client_scoped_subscription" {
    for_each = each.value.client_scoped_subscription != null ? each.value.client_scoped_subscription : []
    content {
      client_id                               = client_scoped_subscription.value.client_id
      is_client_scoped_subscription_shareable = client_scoped_subscription.value.is_client_scoped_subscription_shareable
    }
  }
}
