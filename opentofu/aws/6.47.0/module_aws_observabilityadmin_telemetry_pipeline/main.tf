resource "aws_observabilityadmin_telemetry_pipeline" "observabilityadmin_telemetry_pipelines" {
  for_each = var.observabilityadmin_telemetry_pipelines

  name   = each.value.name
  region = each.value.region
  tags   = each.value.tags

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {
      body = configuration.value.body
    }
  }
}
