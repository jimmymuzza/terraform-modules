resource "aws_cloudwatch_metric_stream" "cloudwatch_metric_streams" {
  for_each = var.cloudwatch_metric_streams

  firehose_arn                    = each.value.firehose_arn
  output_format                   = each.value.output_format
  role_arn                        = each.value.role_arn
  include_linked_accounts_metrics = each.value.include_linked_accounts_metrics
  name                            = each.value.name
  name_prefix                     = each.value.name_prefix
  region                          = each.value.region
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all

  dynamic "exclude_filter" {
    for_each = each.value.exclude_filter != null ? each.value.exclude_filter : []
    content {
      namespace    = exclude_filter.value.namespace
      metric_names = exclude_filter.value.metric_names
    }
  }

  dynamic "include_filter" {
    for_each = each.value.include_filter != null ? each.value.include_filter : []
    content {
      namespace    = include_filter.value.namespace
      metric_names = include_filter.value.metric_names
    }
  }

  dynamic "statistics_configuration" {
    for_each = each.value.statistics_configuration != null ? each.value.statistics_configuration : []
    content {
      additional_statistics = statistics_configuration.value.additional_statistics

      dynamic "include_metric" {
        for_each = statistics_configuration.value.include_metric != null ? statistics_configuration.value.include_metric : []
        content {
          metric_name = include_metric.value.metric_name
          namespace   = include_metric.value.namespace
        }
      }
    }
  }
}
