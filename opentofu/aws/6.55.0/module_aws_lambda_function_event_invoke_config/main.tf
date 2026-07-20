resource "aws_lambda_function_event_invoke_config" "lambda_function_event_invoke_configs" {
  for_each = var.lambda_function_event_invoke_configs

  function_name                = each.value.function_name
  maximum_event_age_in_seconds = each.value.maximum_event_age_in_seconds
  maximum_retry_attempts       = each.value.maximum_retry_attempts
  qualifier                    = each.value.qualifier
  region                       = each.value.region

  dynamic "destination_config" {
    for_each = each.value.destination_config != null ? each.value.destination_config : []
    content {

      dynamic "on_failure" {
        for_each = destination_config.value.on_failure != null ? destination_config.value.on_failure : []
        content {
          destination = on_failure.value.destination
        }
      }

      dynamic "on_success" {
        for_each = destination_config.value.on_success != null ? destination_config.value.on_success : []
        content {
          destination = on_success.value.destination
        }
      }
    }
  }
}
