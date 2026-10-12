resource "aws_lambda_function_url" "lambda_function_urls" {
  for_each = var.lambda_function_urls

  authorization_type = each.value.authorization_type
  function_name      = each.value.function_name
  invoke_mode        = each.value.invoke_mode
  qualifier          = each.value.qualifier
  region             = each.value.region

  dynamic "cors" {
    for_each = each.value.cors != null ? each.value.cors : []
    content {
      allow_credentials = cors.value.allow_credentials
      allow_headers     = cors.value.allow_headers
      allow_methods     = cors.value.allow_methods
      allow_origins     = cors.value.allow_origins
      expose_headers    = cors.value.expose_headers
      max_age           = cors.value.max_age
    }
  }
}
