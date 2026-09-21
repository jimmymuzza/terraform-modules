resource "aws_workspacesweb_data_protection_settings" "workspacesweb_data_protection_settings" {
  for_each = var.workspacesweb_data_protection_settings

  display_name                  = each.value.display_name
  additional_encryption_context = each.value.additional_encryption_context
  customer_managed_key          = each.value.customer_managed_key
  description                   = each.value.description
  region                        = each.value.region
  tags                          = each.value.tags

  dynamic "inline_redaction_configuration" {
    for_each = each.value.inline_redaction_configuration != null ? each.value.inline_redaction_configuration : []
    content {
      global_confidence_level = inline_redaction_configuration.value.global_confidence_level
      global_enforced_urls    = inline_redaction_configuration.value.global_enforced_urls
      global_exempt_urls      = inline_redaction_configuration.value.global_exempt_urls

      dynamic "inline_redaction_pattern" {
        for_each = inline_redaction_configuration.value.inline_redaction_pattern != null ? inline_redaction_configuration.value.inline_redaction_pattern : []
        content {
          built_in_pattern_id = inline_redaction_pattern.value.built_in_pattern_id
          confidence_level    = inline_redaction_pattern.value.confidence_level
          enforced_urls       = inline_redaction_pattern.value.enforced_urls
          exempt_urls         = inline_redaction_pattern.value.exempt_urls

          dynamic "custom_pattern" {
            for_each = inline_redaction_pattern.value.custom_pattern != null ? inline_redaction_pattern.value.custom_pattern : []
            content {
              pattern_name        = custom_pattern.value.pattern_name
              pattern_regex       = custom_pattern.value.pattern_regex
              keyword_regex       = custom_pattern.value.keyword_regex
              pattern_description = custom_pattern.value.pattern_description
            }
          }

          dynamic "redaction_place_holder" {
            for_each = inline_redaction_pattern.value.redaction_place_holder != null ? inline_redaction_pattern.value.redaction_place_holder : []
            content {
              redaction_place_holder_type = redaction_place_holder.value.redaction_place_holder_type
              redaction_place_holder_text = redaction_place_holder.value.redaction_place_holder_text
            }
          }
        }
      }
    }
  }
}
