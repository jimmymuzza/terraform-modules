resource "aws_sfn_alias" "sfn_alias" {
  for_each = var.sfn_alias

  name        = each.value.name
  description = each.value.description
  region      = each.value.region

  dynamic "routing_configuration" {
    for_each = each.value.routing_configuration != null ? each.value.routing_configuration : []
    content {
      state_machine_version_arn = routing_configuration.value.state_machine_version_arn
      weight                    = routing_configuration.value.weight
    }
  }
}
