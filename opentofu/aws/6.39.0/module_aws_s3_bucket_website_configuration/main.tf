resource "aws_s3_bucket_website_configuration" "s3_bucket_website_configurations" {
  for_each = var.s3_bucket_website_configurations

  bucket                = each.value.bucket
  expected_bucket_owner = each.value.expected_bucket_owner
  region                = each.value.region
  routing_rules         = each.value.routing_rules

  dynamic "error_document" {
    for_each = each.value.error_document != null ? each.value.error_document : []
    content {
      key = error_document.value.key
    }
  }

  dynamic "index_document" {
    for_each = each.value.index_document != null ? each.value.index_document : []
    content {
      suffix = index_document.value.suffix
    }
  }

  dynamic "redirect_all_requests_to" {
    for_each = each.value.redirect_all_requests_to != null ? each.value.redirect_all_requests_to : []
    content {
      host_name = redirect_all_requests_to.value.host_name
      protocol  = redirect_all_requests_to.value.protocol
    }
  }

  dynamic "routing_rule" {
    for_each = each.value.routing_rule != null ? each.value.routing_rule : []
    content {

      dynamic "condition" {
        for_each = routing_rule.value.condition != null ? routing_rule.value.condition : []
        content {
          http_error_code_returned_equals = condition.value.http_error_code_returned_equals
          key_prefix_equals               = condition.value.key_prefix_equals
        }
      }

      dynamic "redirect" {
        for_each = routing_rule.value.redirect != null ? routing_rule.value.redirect : []
        content {
          host_name               = redirect.value.host_name
          http_redirect_code      = redirect.value.http_redirect_code
          protocol                = redirect.value.protocol
          replace_key_prefix_with = redirect.value.replace_key_prefix_with
          replace_key_with        = redirect.value.replace_key_with
        }
      }
    }
  }
}
