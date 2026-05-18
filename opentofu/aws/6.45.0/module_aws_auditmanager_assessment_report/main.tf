resource "aws_auditmanager_assessment_report" "auditmanager_assessment_reports" {
  for_each = var.auditmanager_assessment_reports

  assessment_id = each.value.assessment_id
  name          = each.value.name
  description   = each.value.description
  region        = each.value.region
}
