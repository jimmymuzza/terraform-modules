resource "aws_rum_metrics_destination" "rum_metrics_destinations" {
  for_each = var.rum_metrics_destinations

  app_monitor_name = each.value.app_monitor_name
  destination      = each.value.destination
  destination_arn  = each.value.destination_arn
  iam_role_arn     = each.value.iam_role_arn
  region           = each.value.region
}
