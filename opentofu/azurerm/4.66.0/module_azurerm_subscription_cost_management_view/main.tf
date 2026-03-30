resource "azurerm_subscription_cost_management_view" "subscription_cost_management_views" {
  for_each = var.subscription_cost_management_views

  accumulated     = each.value.accumulated
  chart_type      = each.value.chart_type
  display_name    = each.value.display_name
  name            = each.value.name
  report_type     = each.value.report_type
  subscription_id = each.value.subscription_id
  timeframe       = each.value.timeframe

  dynamic "dataset" {
    for_each = each.value.dataset != null ? each.value.dataset : []
    content {
      granularity = dataset.value.granularity

      dynamic "aggregation" {
        for_each = dataset.value.aggregation != null ? dataset.value.aggregation : []
        content {
          column_name = aggregation.value.column_name
          name        = aggregation.value.name
        }
      }

      dynamic "grouping" {
        for_each = dataset.value.grouping != null ? dataset.value.grouping : []
        content {
          name = grouping.value.name
          type = grouping.value.type
        }
      }

      dynamic "sorting" {
        for_each = dataset.value.sorting != null ? dataset.value.sorting : []
        content {
          direction = sorting.value.direction
          name      = sorting.value.name
        }
      }
    }
  }

  dynamic "kpi" {
    for_each = each.value.kpi != null ? each.value.kpi : []
    content {
      type = kpi.value.type
    }
  }

  dynamic "pivot" {
    for_each = each.value.pivot != null ? each.value.pivot : []
    content {
      name = pivot.value.name
      type = pivot.value.type
    }
  }
}
