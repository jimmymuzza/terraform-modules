resource "aws_cloudfront_field_level_encryption_config" "cloudfront_field_level_encryption_configs" {
  for_each = var.cloudfront_field_level_encryption_configs

  comment = each.value.comment

  dynamic "content_type_profile_config" {
    for_each = each.value.content_type_profile_config != null ? each.value.content_type_profile_config : []
    content {
      forward_when_content_type_is_unknown = content_type_profile_config.value.forward_when_content_type_is_unknown

      dynamic "content_type_profiles" {
        for_each = content_type_profile_config.value.content_type_profiles != null ? content_type_profile_config.value.content_type_profiles : []
        content {

          dynamic "items" {
            for_each = content_type_profiles.value.items != null ? content_type_profiles.value.items : []
            content {
              content_type = items.value.content_type
              format       = items.value.format
              profile_id   = items.value.profile_id
            }
          }
        }
      }
    }
  }

  dynamic "query_arg_profile_config" {
    for_each = each.value.query_arg_profile_config != null ? each.value.query_arg_profile_config : []
    content {
      forward_when_query_arg_profile_is_unknown = query_arg_profile_config.value.forward_when_query_arg_profile_is_unknown

      dynamic "query_arg_profiles" {
        for_each = query_arg_profile_config.value.query_arg_profiles != null ? query_arg_profile_config.value.query_arg_profiles : []
        content {

          dynamic "items" {
            for_each = query_arg_profiles.value.items != null ? query_arg_profiles.value.items : []
            content {
              profile_id = items.value.profile_id
              query_arg  = items.value.query_arg
            }
          }
        }
      }
    }
  }
}
