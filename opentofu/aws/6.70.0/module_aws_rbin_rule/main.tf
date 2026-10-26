resource "aws_rbin_rule" "rbin_rules" {
  for_each = var.rbin_rules

  resource_type = each.value.resource_type
  description   = each.value.description
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all

  dynamic "exclude_resource_tags" {
    for_each = each.value.exclude_resource_tags != null ? each.value.exclude_resource_tags : []
    content {
      resource_tag_key   = exclude_resource_tags.value.resource_tag_key
      resource_tag_value = exclude_resource_tags.value.resource_tag_value
    }
  }

  dynamic "lock_configuration" {
    for_each = each.value.lock_configuration != null ? each.value.lock_configuration : []
    content {

      dynamic "unlock_delay" {
        for_each = lock_configuration.value.unlock_delay != null ? lock_configuration.value.unlock_delay : []
        content {
          unlock_delay_unit  = unlock_delay.value.unlock_delay_unit
          unlock_delay_value = unlock_delay.value.unlock_delay_value
        }
      }
    }
  }

  dynamic "resource_tags" {
    for_each = each.value.resource_tags != null ? each.value.resource_tags : []
    content {
      resource_tag_key   = resource_tags.value.resource_tag_key
      resource_tag_value = resource_tags.value.resource_tag_value
    }
  }

  dynamic "retention_period" {
    for_each = each.value.retention_period != null ? each.value.retention_period : []
    content {
      retention_period_unit  = retention_period.value.retention_period_unit
      retention_period_value = retention_period.value.retention_period_value
    }
  }
}
