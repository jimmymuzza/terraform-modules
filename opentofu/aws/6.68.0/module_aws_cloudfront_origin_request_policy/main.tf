resource "aws_cloudfront_origin_request_policy" "cloudfront_origin_request_policies" {
  for_each = var.cloudfront_origin_request_policies

  name    = each.value.name
  comment = each.value.comment

  dynamic "cookies_config" {
    for_each = each.value.cookies_config != null ? each.value.cookies_config : []
    content {
      cookie_behavior = cookies_config.value.cookie_behavior

      dynamic "cookies" {
        for_each = cookies_config.value.cookies != null ? cookies_config.value.cookies : []
        content {
          items = cookies.value.items
        }
      }
    }
  }

  dynamic "headers_config" {
    for_each = each.value.headers_config != null ? each.value.headers_config : []
    content {
      header_behavior = headers_config.value.header_behavior

      dynamic "headers" {
        for_each = headers_config.value.headers != null ? headers_config.value.headers : []
        content {
          items = headers.value.items
        }
      }
    }
  }

  dynamic "query_strings_config" {
    for_each = each.value.query_strings_config != null ? each.value.query_strings_config : []
    content {
      query_string_behavior = query_strings_config.value.query_string_behavior

      dynamic "query_strings" {
        for_each = query_strings_config.value.query_strings != null ? query_strings_config.value.query_strings : []
        content {
          items = query_strings.value.items
        }
      }
    }
  }
}
