resource "aws_lambda_function_recursion_config" "lambda_function_recursion_configs" {
  for_each = var.lambda_function_recursion_configs

  function_name  = each.value.function_name
  recursive_loop = each.value.recursive_loop
  region         = each.value.region
}
