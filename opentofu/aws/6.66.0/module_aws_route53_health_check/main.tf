resource "aws_route53_health_check" "route53_health_checks" {
  for_each = var.route53_health_checks

  type                            = each.value.type
  child_health_threshold          = each.value.child_health_threshold
  child_healthchecks              = each.value.child_healthchecks
  cloudwatch_alarm_name           = each.value.cloudwatch_alarm_name
  cloudwatch_alarm_region         = each.value.cloudwatch_alarm_region
  disabled                        = each.value.disabled
  enable_sni                      = each.value.enable_sni
  failure_threshold               = each.value.failure_threshold
  fqdn                            = each.value.fqdn
  insufficient_data_health_status = each.value.insufficient_data_health_status
  invert_healthcheck              = each.value.invert_healthcheck
  ip_address                      = each.value.ip_address
  measure_latency                 = each.value.measure_latency
  port                            = each.value.port
  reference_name                  = each.value.reference_name
  regions                         = each.value.regions
  request_interval                = each.value.request_interval
  resource_path                   = each.value.resource_path
  routing_control_arn             = each.value.routing_control_arn
  search_string                   = each.value.search_string
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
  triggers                        = each.value.triggers
}
