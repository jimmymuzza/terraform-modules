resource "azurerm_consumption_budget_management_group" "consumption_budget_management_groups" {
  for_each = var.consumption_budget_management_groups

  amount              = each.value.amount
  management_group_id = each.value.management_group_id
  name                = each.value.name
  etag                = each.value.etag
  time_grain          = each.value.time_grain

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {

      dynamic "dimension" {
        for_each = filter.value.dimension != null ? filter.value.dimension : []
        content {
          name     = dimension.value.name
          values   = dimension.value.values
          operator = dimension.value.operator
        }
      }

      dynamic "tag" {
        for_each = filter.value.tag != null ? filter.value.tag : []
        content {
          name     = tag.value.name
          values   = tag.value.values
          operator = tag.value.operator
        }
      }
    }
  }

  dynamic "notification" {
    for_each = each.value.notification != null ? each.value.notification : []
    content {
      contact_emails = notification.value.contact_emails
      operator       = notification.value.operator
      threshold      = notification.value.threshold
      enabled        = notification.value.enabled
      threshold_type = notification.value.threshold_type
    }
  }

  dynamic "time_period" {
    for_each = each.value.time_period != null ? each.value.time_period : []
    content {
      start_date = time_period.value.start_date
      end_date   = time_period.value.end_date
    }
  }
}
