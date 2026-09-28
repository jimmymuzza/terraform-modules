resource "aws_codedeploy_deployment_config" "codedeploy_deployment_configs" {
  for_each = var.codedeploy_deployment_configs

  deployment_config_name = each.value.deployment_config_name
  compute_platform       = each.value.compute_platform
  region                 = each.value.region

  dynamic "minimum_healthy_hosts" {
    for_each = each.value.minimum_healthy_hosts != null ? each.value.minimum_healthy_hosts : []
    content {
      type  = minimum_healthy_hosts.value.type
      value = minimum_healthy_hosts.value.value
    }
  }

  dynamic "traffic_routing_config" {
    for_each = each.value.traffic_routing_config != null ? each.value.traffic_routing_config : []
    content {
      type = traffic_routing_config.value.type

      dynamic "time_based_canary" {
        for_each = traffic_routing_config.value.time_based_canary != null ? traffic_routing_config.value.time_based_canary : []
        content {
          interval   = time_based_canary.value.interval
          percentage = time_based_canary.value.percentage
        }
      }

      dynamic "time_based_linear" {
        for_each = traffic_routing_config.value.time_based_linear != null ? traffic_routing_config.value.time_based_linear : []
        content {
          interval   = time_based_linear.value.interval
          percentage = time_based_linear.value.percentage
        }
      }
    }
  }

  dynamic "zonal_config" {
    for_each = each.value.zonal_config != null ? each.value.zonal_config : []
    content {
      first_zone_monitor_duration_in_seconds = zonal_config.value.first_zone_monitor_duration_in_seconds
      monitor_duration_in_seconds            = zonal_config.value.monitor_duration_in_seconds

      dynamic "minimum_healthy_hosts_per_zone" {
        for_each = zonal_config.value.minimum_healthy_hosts_per_zone != null ? zonal_config.value.minimum_healthy_hosts_per_zone : []
        content {
          type  = minimum_healthy_hosts_per_zone.value.type
          value = minimum_healthy_hosts_per_zone.value.value
        }
      }
    }
  }
}
