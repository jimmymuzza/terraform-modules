resource "aws_elb" "elbs" {
  for_each = var.elbs

  availability_zones          = each.value.availability_zones
  connection_draining         = each.value.connection_draining
  connection_draining_timeout = each.value.connection_draining_timeout
  cross_zone_load_balancing   = each.value.cross_zone_load_balancing
  desync_mitigation_mode      = each.value.desync_mitigation_mode
  idle_timeout                = each.value.idle_timeout
  instances                   = each.value.instances
  internal                    = each.value.internal
  name                        = each.value.name
  name_prefix                 = each.value.name_prefix
  region                      = each.value.region
  security_groups             = each.value.security_groups
  source_security_group       = each.value.source_security_group
  subnets                     = each.value.subnets
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all

  dynamic "access_logs" {
    for_each = each.value.access_logs != null ? each.value.access_logs : []
    content {
      bucket        = access_logs.value.bucket
      bucket_prefix = access_logs.value.bucket_prefix
      enabled       = access_logs.value.enabled
      interval      = access_logs.value.interval
    }
  }

  dynamic "health_check" {
    for_each = each.value.health_check != null ? each.value.health_check : []
    content {
      healthy_threshold   = health_check.value.healthy_threshold
      interval            = health_check.value.interval
      target              = health_check.value.target
      timeout             = health_check.value.timeout
      unhealthy_threshold = health_check.value.unhealthy_threshold
    }
  }

  dynamic "listener" {
    for_each = each.value.listener != null ? each.value.listener : []
    content {
      instance_port      = listener.value.instance_port
      instance_protocol  = listener.value.instance_protocol
      lb_port            = listener.value.lb_port
      lb_protocol        = listener.value.lb_protocol
      ssl_certificate_id = listener.value.ssl_certificate_id
    }
  }
}
