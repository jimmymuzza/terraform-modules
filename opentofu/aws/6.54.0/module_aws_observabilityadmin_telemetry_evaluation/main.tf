resource "aws_observabilityadmin_telemetry_evaluation" "observabilityadmin_telemetry_evaluations" {
  for_each = var.observabilityadmin_telemetry_evaluations

  region = each.value.region
}
