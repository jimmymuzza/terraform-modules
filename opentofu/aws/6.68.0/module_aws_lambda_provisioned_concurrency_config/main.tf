resource "aws_lambda_provisioned_concurrency_config" "lambda_provisioned_concurrency_configs" {
  for_each = var.lambda_provisioned_concurrency_configs

  function_name                     = each.value.function_name
  provisioned_concurrent_executions = each.value.provisioned_concurrent_executions
  qualifier                         = each.value.qualifier
  region                            = each.value.region
  skip_destroy                      = each.value.skip_destroy
}
