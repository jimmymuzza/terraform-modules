resource "aws_lambda_function_scaling_config" "lambda_function_scaling_configs" {
  for_each = var.lambda_function_scaling_configs

  function_name = each.value.function_name
  qualifier     = each.value.qualifier
  region        = each.value.region

  dynamic "function_scaling_config" {
    for_each = each.value.function_scaling_config != null ? each.value.function_scaling_config : []
    content {
      max_execution_environments = function_scaling_config.value.max_execution_environments
      min_execution_environments = function_scaling_config.value.min_execution_environments
    }
  }
}
