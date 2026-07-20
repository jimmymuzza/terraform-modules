resource "aws_lightsail_lb_https_redirection_policy" "lightsail_lb_https_redirection_policies" {
  for_each = var.lightsail_lb_https_redirection_policies

  enabled = each.value.enabled
  lb_name = each.value.lb_name
  region  = each.value.region
}
