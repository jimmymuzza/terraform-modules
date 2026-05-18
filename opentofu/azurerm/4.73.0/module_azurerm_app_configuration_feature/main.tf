resource "azurerm_app_configuration_feature" "app_configuration_features" {
  for_each = var.app_configuration_features

  configuration_store_id  = each.value.configuration_store_id
  name                    = each.value.name
  description             = each.value.description
  enabled                 = each.value.enabled
  etag                    = each.value.etag
  key                     = each.value.key
  label                   = each.value.label
  locked                  = each.value.locked
  percentage_filter_value = each.value.percentage_filter_value
  tags                    = each.value.tags

  dynamic "custom_filter" {
    for_each = each.value.custom_filter != null ? each.value.custom_filter : []
    content {
      name       = custom_filter.value.name
      parameters = custom_filter.value.parameters
    }
  }

  dynamic "targeting_filter" {
    for_each = each.value.targeting_filter != null ? each.value.targeting_filter : []
    content {
      default_rollout_percentage = targeting_filter.value.default_rollout_percentage
      users                      = targeting_filter.value.users

      dynamic "groups" {
        for_each = targeting_filter.value.groups != null ? targeting_filter.value.groups : []
        content {
          name               = groups.value.name
          rollout_percentage = groups.value.rollout_percentage
        }
      }
    }
  }

  dynamic "timewindow_filter" {
    for_each = each.value.timewindow_filter != null ? each.value.timewindow_filter : []
    content {
      end   = timewindow_filter.value.end
      start = timewindow_filter.value.start
    }
  }
}
