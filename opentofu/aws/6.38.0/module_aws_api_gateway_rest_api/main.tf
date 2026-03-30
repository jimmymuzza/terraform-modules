resource "aws_api_gateway_rest_api" "api_gateway_rest_apis" {
  for_each = var.api_gateway_rest_apis

  name                         = each.value.name
  api_key_source               = each.value.api_key_source
  binary_media_types           = each.value.binary_media_types
  body                         = each.value.body
  description                  = each.value.description
  disable_execute_api_endpoint = each.value.disable_execute_api_endpoint
  fail_on_warnings             = each.value.fail_on_warnings
  minimum_compression_size     = each.value.minimum_compression_size
  parameters                   = each.value.parameters
  policy                       = each.value.policy
  put_rest_api_mode            = each.value.put_rest_api_mode
  region                       = each.value.region
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all

  dynamic "endpoint_configuration" {
    for_each = each.value.endpoint_configuration != null ? each.value.endpoint_configuration : []
    content {
      types            = endpoint_configuration.value.types
      ip_address_type  = endpoint_configuration.value.ip_address_type
      vpc_endpoint_ids = endpoint_configuration.value.vpc_endpoint_ids
    }
  }
}
