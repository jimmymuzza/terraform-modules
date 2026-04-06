resource "aws_billing_view" "billing_views" {
  for_each = var.billing_views

  name         = each.value.name
  description  = each.value.description
  source_views = each.value.source_views
  tags         = each.value.tags

  dynamic "data_filter_expression" {
    for_each = each.value.data_filter_expression != null ? each.value.data_filter_expression : []
    content {

      dynamic "dimensions" {
        for_each = data_filter_expression.value.dimensions != null ? data_filter_expression.value.dimensions : []
        content {
          key    = dimensions.value.key
          values = dimensions.value.values
        }
      }

      dynamic "tags" {
        for_each = data_filter_expression.value.tags != null ? data_filter_expression.value.tags : []
        content {
          key    = tags.value.key
          values = tags.value.values
        }
      }

      dynamic "time_range" {
        for_each = data_filter_expression.value.time_range != null ? data_filter_expression.value.time_range : []
        content {
          begin_date_inclusive = time_range.value.begin_date_inclusive
          end_date_inclusive   = time_range.value.end_date_inclusive
        }
      }
    }
  }
}
