resource "aws_costoptimizationhub_preferences" "costoptimizationhub_preferences" {
  for_each = var.costoptimizationhub_preferences

  member_account_discount_visibility = each.value.member_account_discount_visibility
  savings_estimation_mode            = each.value.savings_estimation_mode
}
