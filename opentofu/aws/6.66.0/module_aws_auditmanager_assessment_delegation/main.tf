resource "aws_auditmanager_assessment_delegation" "auditmanager_assessment_delegations" {
  for_each = var.auditmanager_assessment_delegations

  assessment_id  = each.value.assessment_id
  control_set_id = each.value.control_set_id
  role_arn       = each.value.role_arn
  role_type      = each.value.role_type
  comment        = each.value.comment
  region         = each.value.region
}
