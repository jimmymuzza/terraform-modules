resource "aws_ssoadmin_application_assignment" "ssoadmin_application_assignments" {
  for_each = var.ssoadmin_application_assignments

  application_arn = each.value.application_arn
  principal_id    = each.value.principal_id
  principal_type  = each.value.principal_type
  region          = each.value.region
}
