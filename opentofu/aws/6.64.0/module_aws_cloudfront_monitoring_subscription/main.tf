resource "aws_cloudfront_monitoring_subscription" "cloudfront_monitoring_subscriptions" {
  for_each = var.cloudfront_monitoring_subscriptions

  distribution_id = each.value.distribution_id

  dynamic "monitoring_subscription" {
    for_each = each.value.monitoring_subscription != null ? each.value.monitoring_subscription : []
    content {

      dynamic "realtime_metrics_subscription_config" {
        for_each = monitoring_subscription.value.realtime_metrics_subscription_config != null ? monitoring_subscription.value.realtime_metrics_subscription_config : []
        content {
          realtime_metrics_subscription_status = realtime_metrics_subscription_config.value.realtime_metrics_subscription_status
        }
      }
    }
  }
}
