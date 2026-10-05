resource "aws_iot_event_configurations" "iot_event_configurations" {
  for_each = var.iot_event_configurations

  event_configurations = each.value.event_configurations
  region               = each.value.region
}
