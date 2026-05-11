resource "aws_msk_configuration" "msk_configurations" {
  for_each = var.msk_configurations

  name              = each.value.name
  server_properties = each.value.server_properties
  description       = each.value.description
  kafka_versions    = each.value.kafka_versions
  region            = each.value.region
}
