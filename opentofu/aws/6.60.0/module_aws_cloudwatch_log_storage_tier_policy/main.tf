resource "aws_cloudwatch_log_storage_tier_policy" "cloudwatch_log_storage_tier_policies" {
  for_each = var.cloudwatch_log_storage_tier_policies

  storage_tier = each.value.storage_tier
  region       = each.value.region
}
