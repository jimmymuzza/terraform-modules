resource "aws_lightsail_lb_stickiness_policy" "lightsail_lb_stickiness_policies" {
  for_each = var.lightsail_lb_stickiness_policies

  cookie_duration = each.value.cookie_duration
  enabled         = each.value.enabled
  lb_name         = each.value.lb_name
  region          = each.value.region
}
