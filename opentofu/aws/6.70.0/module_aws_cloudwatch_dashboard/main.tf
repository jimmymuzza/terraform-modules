resource "aws_cloudwatch_dashboard" "cloudwatch_dashboards" {
  for_each = var.cloudwatch_dashboards

  dashboard_body = each.value.dashboard_body
  dashboard_name = each.value.dashboard_name
  region         = each.value.region
}
