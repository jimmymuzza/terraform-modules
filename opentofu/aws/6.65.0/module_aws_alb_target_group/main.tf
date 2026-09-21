resource "aws_alb_target_group" "alb_target_groups" {
  for_each = var.alb_target_groups

  connection_termination             = each.value.connection_termination
  deregistration_delay               = each.value.deregistration_delay
  ip_address_type                    = each.value.ip_address_type
  lambda_multi_value_headers_enabled = each.value.lambda_multi_value_headers_enabled
  load_balancing_algorithm_type      = each.value.load_balancing_algorithm_type
  load_balancing_anomaly_mitigation  = each.value.load_balancing_anomaly_mitigation
  load_balancing_cross_zone_enabled  = each.value.load_balancing_cross_zone_enabled
  name                               = each.value.name
  name_prefix                        = each.value.name_prefix
  port                               = each.value.port
  preserve_client_ip                 = each.value.preserve_client_ip
  protocol                           = each.value.protocol
  protocol_version                   = each.value.protocol_version
  proxy_protocol_v2                  = each.value.proxy_protocol_v2
  region                             = each.value.region
  slow_start                         = each.value.slow_start
  tags                               = each.value.tags
  tags_all                           = each.value.tags_all
  target_control_port                = each.value.target_control_port
  target_type                        = each.value.target_type
  vpc_id                             = each.value.vpc_id

  dynamic "health_check" {
    for_each = each.value.health_check != null ? each.value.health_check : []
    content {
      enabled             = health_check.value.enabled
      healthy_threshold   = health_check.value.healthy_threshold
      interval            = health_check.value.interval
      matcher             = health_check.value.matcher
      path                = health_check.value.path
      port                = health_check.value.port
      protocol            = health_check.value.protocol
      timeout             = health_check.value.timeout
      unhealthy_threshold = health_check.value.unhealthy_threshold
    }
  }

  dynamic "stickiness" {
    for_each = each.value.stickiness != null ? each.value.stickiness : []
    content {
      type            = stickiness.value.type
      cookie_duration = stickiness.value.cookie_duration
      cookie_name     = stickiness.value.cookie_name
      enabled         = stickiness.value.enabled
    }
  }

  dynamic "target_failover" {
    for_each = each.value.target_failover != null ? each.value.target_failover : []
    content {
      on_deregistration = target_failover.value.on_deregistration
      on_unhealthy      = target_failover.value.on_unhealthy
    }
  }

  dynamic "target_group_health" {
    for_each = each.value.target_group_health != null ? each.value.target_group_health : []
    content {

      dynamic "dns_failover" {
        for_each = target_group_health.value.dns_failover != null ? target_group_health.value.dns_failover : []
        content {
          minimum_healthy_targets_count      = dns_failover.value.minimum_healthy_targets_count
          minimum_healthy_targets_percentage = dns_failover.value.minimum_healthy_targets_percentage
        }
      }

      dynamic "unhealthy_state_routing" {
        for_each = target_group_health.value.unhealthy_state_routing != null ? target_group_health.value.unhealthy_state_routing : []
        content {
          minimum_healthy_targets_count      = unhealthy_state_routing.value.minimum_healthy_targets_count
          minimum_healthy_targets_percentage = unhealthy_state_routing.value.minimum_healthy_targets_percentage
        }
      }
    }
  }

  dynamic "target_health_state" {
    for_each = each.value.target_health_state != null ? each.value.target_health_state : []
    content {
      enable_unhealthy_connection_termination = target_health_state.value.enable_unhealthy_connection_termination
      unhealthy_draining_interval             = target_health_state.value.unhealthy_draining_interval
    }
  }
}
