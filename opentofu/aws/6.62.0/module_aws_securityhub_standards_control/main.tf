resource "aws_securityhub_standards_control" "securityhub_standards_controls" {
  for_each = var.securityhub_standards_controls

  control_status        = each.value.control_status
  standards_control_arn = each.value.standards_control_arn
  disabled_reason       = each.value.disabled_reason
  region                = each.value.region
}
