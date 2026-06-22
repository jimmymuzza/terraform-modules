resource "aws_appsync_function" "appsync_functions" {
  for_each = var.appsync_functions

  api_id                    = each.value.api_id
  data_source               = each.value.data_source
  name                      = each.value.name
  code                      = each.value.code
  description               = each.value.description
  function_version          = each.value.function_version
  max_batch_size            = each.value.max_batch_size
  region                    = each.value.region
  request_mapping_template  = each.value.request_mapping_template
  response_mapping_template = each.value.response_mapping_template

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
