resource "aws_ssoadmin_application_assignment_configuration" "ssoadmin_application_assignment_configurations" {
  for_each = var.ssoadmin_application_assignment_configurations

  application_arn     = each.value.application_arn
  assignment_required = each.value.assignment_required
  region              = each.value.region
}
