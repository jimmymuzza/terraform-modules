resource "aws_lb_cookie_stickiness_policy" "lb_cookie_stickiness_policies" {
  for_each = var.lb_cookie_stickiness_policies

  lb_port                  = each.value.lb_port
  load_balancer            = each.value.load_balancer
  name                     = each.value.name
  cookie_expiration_period = each.value.cookie_expiration_period
  region                   = each.value.region
}
