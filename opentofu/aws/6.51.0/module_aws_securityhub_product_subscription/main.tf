resource "aws_securityhub_product_subscription" "securityhub_product_subscriptions" {
  for_each = var.securityhub_product_subscriptions

  product_arn = each.value.product_arn
  region      = each.value.region
}
