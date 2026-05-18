resource "aws_route53recoverycontrolconfig_control_panel" "route53recoverycontrolconfig_control_panels" {
  for_each = var.route53recoverycontrolconfig_control_panels

  cluster_arn = each.value.cluster_arn
  name        = each.value.name
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
