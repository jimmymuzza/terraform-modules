resource "aws_pricingplanmanager_subscription" "pricingplanmanager_subscriptions" {
  for_each = var.pricingplanmanager_subscriptions

  plan_family   = each.value.plan_family
  plan_tier     = each.value.plan_tier
  resource_arns = each.value.resource_arns
  approval_mode = each.value.approval_mode
  usage_level   = each.value.usage_level
}
