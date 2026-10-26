resource "aws_cloudwatch_otel_enrichment" "cloudwatch_otel_enrichments" {
  for_each = var.cloudwatch_otel_enrichments

  region = each.value.region

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
}
