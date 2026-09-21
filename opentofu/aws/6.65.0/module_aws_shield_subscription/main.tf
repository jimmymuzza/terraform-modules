resource "aws_shield_subscription" "shield_subscriptions" {
  for_each = var.shield_subscriptions

  auto_renew   = each.value.auto_renew
  skip_destroy = each.value.skip_destroy
}
