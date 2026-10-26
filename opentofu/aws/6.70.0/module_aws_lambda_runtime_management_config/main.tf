resource "aws_lambda_runtime_management_config" "lambda_runtime_management_configs" {
  for_each = var.lambda_runtime_management_configs

  function_name       = each.value.function_name
  qualifier           = each.value.qualifier
  region              = each.value.region
  runtime_version_arn = each.value.runtime_version_arn
  update_runtime_on   = each.value.update_runtime_on
}
