resource "azurerm_eventgrid_event_subscription" "eventgrid_event_subscriptions" {
  for_each = var.eventgrid_event_subscriptions

  name                                 = each.value.name
  scope                                = each.value.scope
  advanced_filtering_on_arrays_enabled = each.value.advanced_filtering_on_arrays_enabled
  event_delivery_schema                = each.value.event_delivery_schema
  eventhub_endpoint_id                 = each.value.eventhub_endpoint_id
  expiration_time_utc                  = each.value.expiration_time_utc
  hybrid_connection_endpoint_id        = each.value.hybrid_connection_endpoint_id
  included_event_types                 = each.value.included_event_types
  labels                               = each.value.labels
  service_bus_queue_endpoint_id        = each.value.service_bus_queue_endpoint_id
  service_bus_topic_endpoint_id        = each.value.service_bus_topic_endpoint_id

  dynamic "advanced_filter" {
    for_each = each.value.advanced_filter != null ? each.value.advanced_filter : []
    content {

      dynamic "bool_equals" {
        for_each = advanced_filter.value.bool_equals != null ? advanced_filter.value.bool_equals : []
        content {
          key   = bool_equals.value.key
          value = bool_equals.value.value
        }
      }

      dynamic "is_not_null" {
        for_each = advanced_filter.value.is_not_null != null ? advanced_filter.value.is_not_null : []
        content {
          key = is_not_null.value.key
        }
      }

      dynamic "is_null_or_undefined" {
        for_each = advanced_filter.value.is_null_or_undefined != null ? advanced_filter.value.is_null_or_undefined : []
        content {
          key = is_null_or_undefined.value.key
        }
      }

      dynamic "number_greater_than" {
        for_each = advanced_filter.value.number_greater_than != null ? advanced_filter.value.number_greater_than : []
        content {
          key   = number_greater_than.value.key
          value = number_greater_than.value.value
        }
      }

      dynamic "number_greater_than_or_equals" {
        for_each = advanced_filter.value.number_greater_than_or_equals != null ? advanced_filter.value.number_greater_than_or_equals : []
        content {
          key   = number_greater_than_or_equals.value.key
          value = number_greater_than_or_equals.value.value
        }
      }

      dynamic "number_in" {
        for_each = advanced_filter.value.number_in != null ? advanced_filter.value.number_in : []
        content {
          key    = number_in.value.key
          values = number_in.value.values
        }
      }

      dynamic "number_in_range" {
        for_each = advanced_filter.value.number_in_range != null ? advanced_filter.value.number_in_range : []
        content {
          key    = number_in_range.value.key
          values = number_in_range.value.values
        }
      }

      dynamic "number_less_than" {
        for_each = advanced_filter.value.number_less_than != null ? advanced_filter.value.number_less_than : []
        content {
          key   = number_less_than.value.key
          value = number_less_than.value.value
        }
      }

      dynamic "number_less_than_or_equals" {
        for_each = advanced_filter.value.number_less_than_or_equals != null ? advanced_filter.value.number_less_than_or_equals : []
        content {
          key   = number_less_than_or_equals.value.key
          value = number_less_than_or_equals.value.value
        }
      }

      dynamic "number_not_in" {
        for_each = advanced_filter.value.number_not_in != null ? advanced_filter.value.number_not_in : []
        content {
          key    = number_not_in.value.key
          values = number_not_in.value.values
        }
      }

      dynamic "number_not_in_range" {
        for_each = advanced_filter.value.number_not_in_range != null ? advanced_filter.value.number_not_in_range : []
        content {
          key    = number_not_in_range.value.key
          values = number_not_in_range.value.values
        }
      }

      dynamic "string_begins_with" {
        for_each = advanced_filter.value.string_begins_with != null ? advanced_filter.value.string_begins_with : []
        content {
          key    = string_begins_with.value.key
          values = string_begins_with.value.values
        }
      }

      dynamic "string_contains" {
        for_each = advanced_filter.value.string_contains != null ? advanced_filter.value.string_contains : []
        content {
          key    = string_contains.value.key
          values = string_contains.value.values
        }
      }

      dynamic "string_ends_with" {
        for_each = advanced_filter.value.string_ends_with != null ? advanced_filter.value.string_ends_with : []
        content {
          key    = string_ends_with.value.key
          values = string_ends_with.value.values
        }
      }

      dynamic "string_in" {
        for_each = advanced_filter.value.string_in != null ? advanced_filter.value.string_in : []
        content {
          key    = string_in.value.key
          values = string_in.value.values
        }
      }

      dynamic "string_not_begins_with" {
        for_each = advanced_filter.value.string_not_begins_with != null ? advanced_filter.value.string_not_begins_with : []
        content {
          key    = string_not_begins_with.value.key
          values = string_not_begins_with.value.values
        }
      }

      dynamic "string_not_contains" {
        for_each = advanced_filter.value.string_not_contains != null ? advanced_filter.value.string_not_contains : []
        content {
          key    = string_not_contains.value.key
          values = string_not_contains.value.values
        }
      }

      dynamic "string_not_ends_with" {
        for_each = advanced_filter.value.string_not_ends_with != null ? advanced_filter.value.string_not_ends_with : []
        content {
          key    = string_not_ends_with.value.key
          values = string_not_ends_with.value.values
        }
      }

      dynamic "string_not_in" {
        for_each = advanced_filter.value.string_not_in != null ? advanced_filter.value.string_not_in : []
        content {
          key    = string_not_in.value.key
          values = string_not_in.value.values
        }
      }
    }
  }

  dynamic "azure_function_endpoint" {
    for_each = each.value.azure_function_endpoint != null ? each.value.azure_function_endpoint : []
    content {
      function_id                       = azure_function_endpoint.value.function_id
      max_events_per_batch              = azure_function_endpoint.value.max_events_per_batch
      preferred_batch_size_in_kilobytes = azure_function_endpoint.value.preferred_batch_size_in_kilobytes
    }
  }

  dynamic "dead_letter_identity" {
    for_each = each.value.dead_letter_identity != null ? each.value.dead_letter_identity : []
    content {
      type                   = dead_letter_identity.value.type
      user_assigned_identity = dead_letter_identity.value.user_assigned_identity
    }
  }

  dynamic "delivery_identity" {
    for_each = each.value.delivery_identity != null ? each.value.delivery_identity : []
    content {
      type                   = delivery_identity.value.type
      user_assigned_identity = delivery_identity.value.user_assigned_identity
    }
  }

  dynamic "delivery_property" {
    for_each = each.value.delivery_property != null ? each.value.delivery_property : []
    content {
      header_name  = delivery_property.value.header_name
      type         = delivery_property.value.type
      secret       = delivery_property.value.secret
      source_field = delivery_property.value.source_field
      value        = delivery_property.value.value
    }
  }

  dynamic "retry_policy" {
    for_each = each.value.retry_policy != null ? each.value.retry_policy : []
    content {
      event_time_to_live    = retry_policy.value.event_time_to_live
      max_delivery_attempts = retry_policy.value.max_delivery_attempts
    }
  }

  dynamic "storage_blob_dead_letter_destination" {
    for_each = each.value.storage_blob_dead_letter_destination != null ? each.value.storage_blob_dead_letter_destination : []
    content {
      storage_account_id          = storage_blob_dead_letter_destination.value.storage_account_id
      storage_blob_container_name = storage_blob_dead_letter_destination.value.storage_blob_container_name
    }
  }

  dynamic "storage_queue_endpoint" {
    for_each = each.value.storage_queue_endpoint != null ? each.value.storage_queue_endpoint : []
    content {
      queue_name                            = storage_queue_endpoint.value.queue_name
      storage_account_id                    = storage_queue_endpoint.value.storage_account_id
      queue_message_time_to_live_in_seconds = storage_queue_endpoint.value.queue_message_time_to_live_in_seconds
    }
  }

  dynamic "subject_filter" {
    for_each = each.value.subject_filter != null ? each.value.subject_filter : []
    content {
      case_sensitive      = subject_filter.value.case_sensitive
      subject_begins_with = subject_filter.value.subject_begins_with
      subject_ends_with   = subject_filter.value.subject_ends_with
    }
  }

  dynamic "webhook_endpoint" {
    for_each = each.value.webhook_endpoint != null ? each.value.webhook_endpoint : []
    content {
      url                               = webhook_endpoint.value.url
      active_directory_app_id_or_uri    = webhook_endpoint.value.active_directory_app_id_or_uri
      active_directory_tenant_id        = webhook_endpoint.value.active_directory_tenant_id
      max_events_per_batch              = webhook_endpoint.value.max_events_per_batch
      preferred_batch_size_in_kilobytes = webhook_endpoint.value.preferred_batch_size_in_kilobytes
    }
  }
}
