resource "aws_iot_indexing_configuration" "iot_indexing_configurations" {
  for_each = var.iot_indexing_configurations

  region = each.value.region

  dynamic "thing_group_indexing_configuration" {
    for_each = each.value.thing_group_indexing_configuration != null ? each.value.thing_group_indexing_configuration : []
    content {
      thing_group_indexing_mode = thing_group_indexing_configuration.value.thing_group_indexing_mode

      dynamic "custom_field" {
        for_each = thing_group_indexing_configuration.value.custom_field != null ? thing_group_indexing_configuration.value.custom_field : []
        content {
          name = custom_field.value.name
          type = custom_field.value.type
        }
      }

      dynamic "managed_field" {
        for_each = thing_group_indexing_configuration.value.managed_field != null ? thing_group_indexing_configuration.value.managed_field : []
        content {
          name = managed_field.value.name
          type = managed_field.value.type
        }
      }
    }
  }

  dynamic "thing_indexing_configuration" {
    for_each = each.value.thing_indexing_configuration != null ? each.value.thing_indexing_configuration : []
    content {
      thing_indexing_mode              = thing_indexing_configuration.value.thing_indexing_mode
      device_defender_indexing_mode    = thing_indexing_configuration.value.device_defender_indexing_mode
      named_shadow_indexing_mode       = thing_indexing_configuration.value.named_shadow_indexing_mode
      thing_connectivity_indexing_mode = thing_indexing_configuration.value.thing_connectivity_indexing_mode

      dynamic "custom_field" {
        for_each = thing_indexing_configuration.value.custom_field != null ? thing_indexing_configuration.value.custom_field : []
        content {
          name = custom_field.value.name
          type = custom_field.value.type
        }
      }

      dynamic "filter" {
        for_each = thing_indexing_configuration.value.filter != null ? thing_indexing_configuration.value.filter : []
        content {
          named_shadow_names = filter.value.named_shadow_names
        }
      }

      dynamic "managed_field" {
        for_each = thing_indexing_configuration.value.managed_field != null ? thing_indexing_configuration.value.managed_field : []
        content {
          name = managed_field.value.name
          type = managed_field.value.type
        }
      }
    }
  }
}
