resource "aws_gamelift_alias" "gamelift_alias" {
  for_each = var.gamelift_alias

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "routing_strategy" {
    for_each = each.value.routing_strategy != null ? each.value.routing_strategy : []
    content {
      type     = routing_strategy.value.type
      fleet_id = routing_strategy.value.fleet_id
      message  = routing_strategy.value.message
    }
  }
}
