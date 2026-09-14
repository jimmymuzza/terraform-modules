resource "aws_securityhub_standards_control_association" "securityhub_standards_control_associations" {
  for_each = var.securityhub_standards_control_associations

  association_status  = each.value.association_status
  security_control_id = each.value.security_control_id
  standards_arn       = each.value.standards_arn
  region              = each.value.region
  updated_reason      = each.value.updated_reason
}
