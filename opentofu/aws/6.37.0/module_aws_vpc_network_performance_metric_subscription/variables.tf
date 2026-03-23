variable "vpc_network_performance_metric_subscriptions" {
  description = <<EOT
Map of vpc_network_performance_metric_subscriptions, attributes below
Required:
    - destination
    - source
Optional:
    - metric
    - region
    - statistic
EOT

  type = map(object({
    destination = string
    source      = string
    metric      = optional(string)
    region      = optional(string)
    statistic   = optional(string)
  }))
}
