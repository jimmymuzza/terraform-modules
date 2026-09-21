resource "aws_computeoptimizer_enrollment_status" "computeoptimizer_enrollment_status" {
  for_each = var.computeoptimizer_enrollment_status

  status                  = each.value.status
  include_member_accounts = each.value.include_member_accounts
  region                  = each.value.region
}
