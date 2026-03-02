resource "aws_route53recoverycontrolconfig_routing_control" "route53recoverycontrolconfig_routing_controls" {
  for_each = var.route53recoverycontrolconfig_routing_controls

  cluster_arn       = each.value.cluster_arn
  name              = each.value.name
  control_panel_arn = each.value.control_panel_arn
}
