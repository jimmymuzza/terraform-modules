resource "aws_observabilityadmin_telemetry_evaluation" "observabilityadmin_telemetry_evaluations" {
  for_each = var.observabilityadmin_telemetry_evaluations

  all_regions = each.value.all_regions
  region      = each.value.region
  regions     = each.value.regions
}
