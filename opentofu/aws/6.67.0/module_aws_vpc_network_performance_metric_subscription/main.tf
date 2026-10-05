resource "aws_vpc_network_performance_metric_subscription" "vpc_network_performance_metric_subscriptions" {
  for_each = var.vpc_network_performance_metric_subscriptions

  destination = each.value.destination
  source      = each.value.source
  metric      = each.value.metric
  region      = each.value.region
  statistic   = each.value.statistic
}
