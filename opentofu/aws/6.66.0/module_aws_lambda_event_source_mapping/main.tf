resource "aws_lambda_event_source_mapping" "lambda_event_source_mappings" {
  for_each = var.lambda_event_source_mappings

  function_name                        = each.value.function_name
  batch_size                           = each.value.batch_size
  bisect_batch_on_function_error       = each.value.bisect_batch_on_function_error
  enabled                              = each.value.enabled
  event_source_arn                     = each.value.event_source_arn
  function_response_types              = each.value.function_response_types
  kms_key_arn                          = each.value.kms_key_arn
  maximum_batching_window_in_seconds   = each.value.maximum_batching_window_in_seconds
  maximum_record_age_in_seconds        = each.value.maximum_record_age_in_seconds
  maximum_retry_attempts               = each.value.maximum_retry_attempts
  parallelization_factor               = each.value.parallelization_factor
  queues                               = each.value.queues
  region                               = each.value.region
  starting_position                    = each.value.starting_position
  starting_position_timestamp          = each.value.starting_position_timestamp
  tags                                 = each.value.tags
  tags_all                             = each.value.tags_all
  topics                               = each.value.topics
  tumbling_window_in_seconds           = each.value.tumbling_window_in_seconds
  use_resource_timeout_for_propagation = each.value.use_resource_timeout_for_propagation

  dynamic "amazon_managed_kafka_event_source_config" {
    for_each = each.value.amazon_managed_kafka_event_source_config != null ? each.value.amazon_managed_kafka_event_source_config : []
    content {
      consumer_group_id = amazon_managed_kafka_event_source_config.value.consumer_group_id

      dynamic "schema_registry_config" {
        for_each = amazon_managed_kafka_event_source_config.value.schema_registry_config != null ? amazon_managed_kafka_event_source_config.value.schema_registry_config : []
        content {
          event_record_format = schema_registry_config.value.event_record_format
          schema_registry_uri = schema_registry_config.value.schema_registry_uri

          dynamic "access_config" {
            for_each = schema_registry_config.value.access_config != null ? schema_registry_config.value.access_config : []
            content {
              type = access_config.value.type
              uri  = access_config.value.uri
            }
          }

          dynamic "schema_validation_config" {
            for_each = schema_registry_config.value.schema_validation_config != null ? schema_registry_config.value.schema_validation_config : []
            content {
              attribute = schema_validation_config.value.attribute
            }
          }
        }
      }
    }
  }

  dynamic "destination_config" {
    for_each = each.value.destination_config != null ? each.value.destination_config : []
    content {

      dynamic "on_failure" {
        for_each = destination_config.value.on_failure != null ? destination_config.value.on_failure : []
        content {
          destination_arn = on_failure.value.destination_arn
        }
      }
    }
  }

  dynamic "document_db_event_source_config" {
    for_each = each.value.document_db_event_source_config != null ? each.value.document_db_event_source_config : []
    content {
      database_name   = document_db_event_source_config.value.database_name
      collection_name = document_db_event_source_config.value.collection_name
      full_document   = document_db_event_source_config.value.full_document
    }
  }

  dynamic "filter_criteria" {
    for_each = each.value.filter_criteria != null ? each.value.filter_criteria : []
    content {

      dynamic "filter" {
        for_each = filter_criteria.value.filter != null ? filter_criteria.value.filter : []
        content {
          pattern = filter.value.pattern
        }
      }
    }
  }

  dynamic "metrics_config" {
    for_each = each.value.metrics_config != null ? each.value.metrics_config : []
    content {
      metrics = metrics_config.value.metrics
    }
  }

  dynamic "provisioned_poller_config" {
    for_each = each.value.provisioned_poller_config != null ? each.value.provisioned_poller_config : []
    content {
      maximum_pollers   = provisioned_poller_config.value.maximum_pollers
      minimum_pollers   = provisioned_poller_config.value.minimum_pollers
      poller_group_name = provisioned_poller_config.value.poller_group_name
    }
  }

  dynamic "scaling_config" {
    for_each = each.value.scaling_config != null ? each.value.scaling_config : []
    content {
      maximum_concurrency = scaling_config.value.maximum_concurrency
    }
  }

  dynamic "self_managed_event_source" {
    for_each = each.value.self_managed_event_source != null ? each.value.self_managed_event_source : []
    content {
      endpoints = self_managed_event_source.value.endpoints
    }
  }

  dynamic "self_managed_kafka_event_source_config" {
    for_each = each.value.self_managed_kafka_event_source_config != null ? each.value.self_managed_kafka_event_source_config : []
    content {
      consumer_group_id = self_managed_kafka_event_source_config.value.consumer_group_id

      dynamic "schema_registry_config" {
        for_each = self_managed_kafka_event_source_config.value.schema_registry_config != null ? self_managed_kafka_event_source_config.value.schema_registry_config : []
        content {
          event_record_format = schema_registry_config.value.event_record_format
          schema_registry_uri = schema_registry_config.value.schema_registry_uri

          dynamic "access_config" {
            for_each = schema_registry_config.value.access_config != null ? schema_registry_config.value.access_config : []
            content {
              type = access_config.value.type
              uri  = access_config.value.uri
            }
          }

          dynamic "schema_validation_config" {
            for_each = schema_registry_config.value.schema_validation_config != null ? schema_registry_config.value.schema_validation_config : []
            content {
              attribute = schema_validation_config.value.attribute
            }
          }
        }
      }
    }
  }

  dynamic "source_access_configuration" {
    for_each = each.value.source_access_configuration != null ? each.value.source_access_configuration : []
    content {
      type = source_access_configuration.value.type
      uri  = source_access_configuration.value.uri
    }
  }
}
