resource "aws_cloudwatch_event_endpoint" "cloudwatch_event_endpoints" {
  for_each = var.cloudwatch_event_endpoints

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  role_arn    = each.value.role_arn

  dynamic "event_bus" {
    for_each = each.value.event_bus != null ? each.value.event_bus : []
    content {
      event_bus_arn = event_bus.value.event_bus_arn
    }
  }

  dynamic "replication_config" {
    for_each = each.value.replication_config != null ? each.value.replication_config : []
    content {
      state = replication_config.value.state
    }
  }

  dynamic "routing_config" {
    for_each = each.value.routing_config != null ? each.value.routing_config : []
    content {

      dynamic "failover_config" {
        for_each = routing_config.value.failover_config != null ? routing_config.value.failover_config : []
        content {

          dynamic "primary" {
            for_each = failover_config.value.primary != null ? failover_config.value.primary : []
            content {
              health_check = primary.value.health_check
            }
          }

          dynamic "secondary" {
            for_each = failover_config.value.secondary != null ? failover_config.value.secondary : []
            content {
              route = secondary.value.route
            }
          }
        }
      }
    }
  }
}
