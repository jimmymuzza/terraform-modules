resource "aws_observabilityadmin_telemetry_evaluation_for_organization" "observabilityadmin_telemetry_evaluation_for_organizations" {
  for_each = var.observabilityadmin_telemetry_evaluation_for_organizations

  all_regions = each.value.all_regions
  region      = each.value.region
  regions     = each.value.regions
}
