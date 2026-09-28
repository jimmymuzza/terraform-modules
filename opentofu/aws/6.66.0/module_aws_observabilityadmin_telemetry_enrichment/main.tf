resource "aws_observabilityadmin_telemetry_enrichment" "observabilityadmin_telemetry_enrichments" {
  for_each = var.observabilityadmin_telemetry_enrichments

  region = each.value.region
}
