resource "aws_spot_datafeed_subscription" "spot_datafeed_subscriptions" {
  for_each = var.spot_datafeed_subscriptions

  bucket = each.value.bucket
  prefix = each.value.prefix
  region = each.value.region
}
