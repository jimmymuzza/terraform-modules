resource "aws_appsync_resolver" "appsync_resolvers" {
  for_each = var.appsync_resolvers

  api_id            = each.value.api_id
  field             = each.value.field
  type              = each.value.type
  code              = each.value.code
  data_source       = each.value.data_source
  kind              = each.value.kind
  max_batch_size    = each.value.max_batch_size
  region            = each.value.region
  request_template  = each.value.request_template
  response_template = each.value.response_template

  dynamic "caching_config" {
    for_each = each.value.caching_config != null ? each.value.caching_config : []
    content {
      caching_keys = caching_config.value.caching_keys
      ttl          = caching_config.value.ttl
    }
  }

  dynamic "pipeline_config" {
    for_each = each.value.pipeline_config != null ? each.value.pipeline_config : []
    content {
      functions = pipeline_config.value.functions
    }
  }

  dynamic "runtime" {
    for_each = each.value.runtime != null ? each.value.runtime : []
    content {
      name            = runtime.value.name
      runtime_version = runtime.value.runtime_version
    }
  }

  dynamic "sync_config" {
    for_each = each.value.sync_config != null ? each.value.sync_config : []
    content {
      conflict_detection = sync_config.value.conflict_detection
      conflict_handler   = sync_config.value.conflict_handler

      dynamic "lambda_conflict_handler_config" {
        for_each = sync_config.value.lambda_conflict_handler_config != null ? sync_config.value.lambda_conflict_handler_config : []
        content {
          lambda_conflict_handler_arn = lambda_conflict_handler_config.value.lambda_conflict_handler_arn
        }
      }
    }
  }
}
