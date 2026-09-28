resource "azurerm_servicebus_topic" "servicebus_topics" {
  for_each = var.servicebus_topics

  name                                    = each.value.name
  namespace_id                            = each.value.namespace_id
  auto_delete_on_idle                     = each.value.auto_delete_on_idle
  batched_operations_enabled              = each.value.batched_operations_enabled
  default_message_ttl                     = each.value.default_message_ttl
  duplicate_detection_history_time_window = each.value.duplicate_detection_history_time_window
  express_enabled                         = each.value.express_enabled
  max_message_size_in_kilobytes           = each.value.max_message_size_in_kilobytes
  max_size_in_megabytes                   = each.value.max_size_in_megabytes
  partitioning_enabled                    = each.value.partitioning_enabled
  requires_duplicate_detection            = each.value.requires_duplicate_detection
  status                                  = each.value.status
  support_ordering                        = each.value.support_ordering
}
