resource "aws_cloudfront_connection_function" "cloudfront_connection_functions" {
  for_each = var.cloudfront_connection_functions

  connection_function_code = each.value.connection_function_code
  name                     = each.value.name
  publish                  = each.value.publish
  tags                     = each.value.tags

  dynamic "connection_function_config" {
    for_each = each.value.connection_function_config != null ? each.value.connection_function_config : []
    content {
      comment = connection_function_config.value.comment
      runtime = connection_function_config.value.runtime

      dynamic "key_value_store_association" {
        for_each = connection_function_config.value.key_value_store_association != null ? connection_function_config.value.key_value_store_association : []
        content {
          key_value_store_arn = key_value_store_association.value.key_value_store_arn
        }
      }
    }
  }
}
