resource "aws_costoptimizationhub_enrollment_status" "costoptimizationhub_enrollment_status" {
  for_each = var.costoptimizationhub_enrollment_status

  include_member_accounts = each.value.include_member_accounts
}
