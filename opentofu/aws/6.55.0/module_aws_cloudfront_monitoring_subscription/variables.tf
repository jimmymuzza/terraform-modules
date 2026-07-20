variable "cloudfront_monitoring_subscriptions" {
  description = <<EOT
Map of cloudfront_monitoring_subscriptions, attributes below
Required:
    - distribution_id
    - monitoring_subscription
EOT

  type = map(object({
    distribution_id         = string
    monitoring_subscription = list(object({
            realtime_metrics_subscription_config = list(object({
                realtime_metrics_subscription_status = string
            }))
        }))
  }))
}
