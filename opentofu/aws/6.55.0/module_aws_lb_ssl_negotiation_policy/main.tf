resource "aws_lb_ssl_negotiation_policy" "lb_ssl_negotiation_policies" {
  for_each = var.lb_ssl_negotiation_policies

  lb_port       = each.value.lb_port
  load_balancer = each.value.load_balancer
  name          = each.value.name
  region        = each.value.region
  triggers      = each.value.triggers

  dynamic "attribute" {
    for_each = each.value.attribute != null ? each.value.attribute : []
    content {
      name  = attribute.value.name
      value = attribute.value.value
    }
  }
}
