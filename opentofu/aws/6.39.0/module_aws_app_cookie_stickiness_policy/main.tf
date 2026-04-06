resource "aws_app_cookie_stickiness_policy" "app_cookie_stickiness_policies" {
  for_each = var.app_cookie_stickiness_policies

  cookie_name   = each.value.cookie_name
  lb_port       = each.value.lb_port
  load_balancer = each.value.load_balancer
  name          = each.value.name
  region        = each.value.region
}
