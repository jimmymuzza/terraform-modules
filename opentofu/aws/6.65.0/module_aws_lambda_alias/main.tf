resource "aws_lambda_alias" "lambda_alias" {
  for_each = var.lambda_alias

  function_name    = each.value.function_name
  function_version = each.value.function_version
  name             = each.value.name
  description      = each.value.description
  region           = each.value.region

  dynamic "routing_config" {
    for_each = each.value.routing_config != null ? each.value.routing_config : []
    content {
      additional_version_weights = routing_config.value.additional_version_weights
    }
  }
}
