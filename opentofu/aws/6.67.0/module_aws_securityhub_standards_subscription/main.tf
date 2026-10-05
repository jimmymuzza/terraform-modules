resource "aws_securityhub_standards_subscription" "securityhub_standards_subscriptions" {
  for_each = var.securityhub_standards_subscriptions

  standards_arn = each.value.standards_arn
  region        = each.value.region
}
